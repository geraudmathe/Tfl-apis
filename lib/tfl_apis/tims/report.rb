require "sax-machine"
require "benchmark"
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

      def request_tfl_apis email
        file = File.expand_path "../../../../examples/stream.xml", __FILE__
        content = File.read file

        # uri = "http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=#{email}&feedId=40"
        # uri = URI.parse(uri)
        # http = Net::HTTP.new(uri.host, uri.port)
        # response = http.request(Net::HTTP::Get.new(uri.request_uri))
        # puts "response size #{response.body.size} bytes"

        # ###WORST HOOK POSSIBLE WHILE TFL DONT FIX THE XLMNS
        bm = Benchmark.measure do
          @source = Root.parse content
        end
        puts "Requested and parsed #{file.size} in #{bm.total} s"
        @source.disruptions
      end
    end
  end
end



