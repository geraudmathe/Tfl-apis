module TflApis
  module Tims
    class Root
      include SAXMachine
      element :Header, as: :infos 
      elements :Disruption, as: :disruptions, class: Disruption
    end

    class Report
      attr_reader :disruptions

      def initialize email
        @disruptions = request_api email
      end

      def request_api email
        # TODO : handle forbidden requests 
        uri = "http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=#{email}&feedId=40"
        uri = URI.parse(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        content = http.request(Net::HTTP::Get.new(uri.request_uri)).body
        raise IOError, "the repsponse from tfl api is empty" if content.size==0
        @source = Root.parse content
        @source.disruptions
      end
    end
  end
end



