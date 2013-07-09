# Tfl Apis

This gem aims to provide a wrapper for the tfl apis [http://www.tfl.gov.uk/businessandpartners/syndication/](http://www.tfl.gov.uk/businessandpartners/syndication/).
For the moment , only the TIMS API is implemented.

## IT IS PRODUCTION READY ?

# NO

## Installation

Add this line to your application's Gemfile:

    gem 'TimsLondon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install TimsLondon

## Usage

Once the gem is installed, you can use

    tims = TflApis::Tims::Report.new "email@email.com"

Now you can access all data contained in the api like:
    
     tims.disruptions # returns an array containing all disruptions 
     tims.disruptions.first # TflApis::Tims::Disruption
     tims.disruptions.first.cause_area # TflApis::Tims::CauseArea
     tims.disruptions.first.cause_area.streets # returns an array containing all streets
     tims.disruptions.first.cause_area.streets.first # TflApis::Tims::Street
     tims.disruptions.first.cause_area.streets.first.links.first.line.beginning_point_ll # returns an array containing beginning lng,lat corrdinates of the line 

Before being able to use the api, you need to subscribe to [Tfl developer program](http://www.tfl.gov.uk/businessandpartners/syndication/16492.aspx) . 

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
* handle polygons tags for tims