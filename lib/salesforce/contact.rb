require 'databasedotcom'

module Salesforce
  class Contact
    def initialize(credentials)
      token, instance_url = credentials

      client = Databasedotcom::Client.new
      client.authenticate(token: token, instance_url: instance_url)

      @@contact = client.materialize('Contact')
    end

    def create(attributes)
      @@contact.create(sanitized_attributes(attributes)).persisted?
    end

    private

    def sanitized_attributes(attributes)
      attributes.select {|a| @@contact.attributes.include?(a)}
    end
  end
end
