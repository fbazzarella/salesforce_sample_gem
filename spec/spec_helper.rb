require 'salesforce/contact'
require 'webmock/rspec'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.color = true
end
