require "sax-machine"
module TflApis
  module CCTV
    class Camera
      include SAXMachine
      attribute :id
      attribute :available
      element :corridor
      element :capture_time
      element :location
      element :file
      element :easting
      element :northing
      element :lat
      element :lng
      element :osgr
      element :postCode, as: :post_code
    end
  end
end