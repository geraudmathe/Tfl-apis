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
        @disruptions = request_tfl_apis email
      end

      def request_api email
        #file = File.expand_path "../../../../examples/stream.xml", __FILE__
        #content = File.read file
        # TODO: handle forbidden requests 
        uri = "http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=#{email}&feedId=40"
        uri = URI.parse(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        content = http.request(Net::HTTP::Get.new(uri.request_uri))
        @source = Root.parse content.body
        @source.disruptions
      end
    end
  end
end



