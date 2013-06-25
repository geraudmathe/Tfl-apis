# Tfl Apis

This gem aims to provide a wrapper for the tfl apis [http://www.tfl.gov.uk/businessandpartners/syndication/](http://www.tfl.gov.uk/businessandpartners/syndication/).
For the moment , only the TIMS API is implemented.

## IT IS PRODUCTION READY ?
## NO

## Installation

Add this line to your application's Gemfile:

    gem 'TimsLondon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install TimsLondon

## Usage

Once the gem is installed, you can use

    TflApis::Tims.new "email@email.com"

Before being able to use the api, you need to subscribe to [Tfl developer program](http://www.tfl.gov.uk/businessandpartners/syndication/16492.aspx)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todo

* implement other Apis
* tests !
* report bugs to Tfl