require 'spec_helper'

describe Salesforce::Contact do
  let!(:credentials) { ['123456', 'https://na17.salesforce.com'] }
  let!(:headers) { {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"OAuth #{credentials[0]}", 'User-Agent'=>'Ruby'} }

  before do
    stub_request(:get, "#{credentials[1]}/services/data/v22.0/sobjects/Contact/describe").with(headers: headers).
       to_return(status: 200, body: File.new('spec/fixtures/sobject.txt').read, headers: {})
  end

  describe '#initialize' do
    before { described_class.new(credentials) }

    it { expect(Module.const_defined?('Contact')).to be(true) }
  end

  describe '.create' do
    before do
      stub_request(:post, "#{credentials[1]}/services/data/v22.0/sobjects/Contact").with(body: "{\"LastName\":\"Doe\"}", headers: headers).
         to_return(status: 200, body: File.new('spec/fixtures/contact.txt').read, headers: {})
    end

    it { expect(described_class.new(credentials).create({'LastName' => 'Doe'})).to be_eql(true) }
  end

  describe 'private methods' do
    describe '.sanitized_attributes' do
      let!(:attributes_with_invalid) { {'InvalidAttribute' => 'InvalidValue', 'LastName' => 'Doe'} }
      let!(:attributes_without_invalid) { {'LastName' => 'Doe'} }

      it { expect(described_class.new(credentials).send(:sanitized_attributes, attributes_with_invalid)).to be_eql(attributes_without_invalid) }
    end
  end
end
