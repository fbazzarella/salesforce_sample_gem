require 'databasedotcom'

module Salesforce
  class Contact
    def initialize(credentials)
      token, instance_url = credentials

      client = Databasedotcom::Client.new
      client.authenticate(token: token, instance_url: instance_url)

      @@contact = client.materialize('Contact')
    end
  end
end
