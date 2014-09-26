# Salesforce Contact

A simplest way to integrate your Rails App with Salesforce Contacts.

## Installation

Add this line to your application's Gemfile:

    gem 'salesforce', github: 'fbazzarella/salesforce_sample_gem'

And then execute:

    $ bundle
    
## Configuration

Before you can use this Gem, your app should be integrated with Salesforce through OAuth.

## Usage

You just should create a new instance of `Salesforce::Contact` and call `create` method with attributes you want.

    Salesforce::Contact.new(credentials).create(attributes)

* `credentials` should be an Array that 1st element is the `token` and the 2nd is the `instance_url`. Both returned by OAuth on authentication request.

* `attributes` should be a Hash with the ActiveRecord attributes you want to repass (eg. `{'LastName' => 'Doe'}`). Note: fields that don't exists on your Salesforce Contact will be ignored.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/salesforce/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
