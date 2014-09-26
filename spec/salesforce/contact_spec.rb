require 'spec_helper'

describe Salesforce::Contact do
  let!(:credentials) { ['123456', 'https://na17.salesforce.com'] }
  let!(:headers) { {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"OAuth #{credentials[0]}", 'User-Agent'=>'Ruby'} }

  describe '#initialize' do
    before do
      stub_request(:get, "#{credentials[1]}/services/data/v22.0/sobjects/Contact/describe").with(headers: headers).
         to_return(status: 200, body: File.new('spec/fixtures/sobject.txt').read, headers: {})

      described_class.new(credentials)
    end

    it { expect(Module.const_defined?('Contact')).to be(true) }
  end
end
