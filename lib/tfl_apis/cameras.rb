require "tfl_apis/cctv/base"

module TflApis
  class Cameras
    URL = "http://www.tfl.gov.uk/tfl/livetravelnews/trafficcams/cctv/jamcams-camera-list.xml"

    def initialize email
      @email = email
    end

    def self.request_api
      http = Net::HTTP.new(url.host, url.port)
      content = http.request(Net::HTTP::Get.new(url.request_uri)).body
      binding.pry
      CCTV::Report.parse content
    end

    def self.url
      URI.parse(URL)
    end
  end
end