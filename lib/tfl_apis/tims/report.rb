require "xml"

module TflApis
  module Tims
    class Report
      attr_reader :disruptions

      def initialize email
        @disruptions ||= get_data(email)
        @disruptions

      end

      def get_data email
        content = request_tfl_apis email
        create_disruptions content
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
        content[0..300] = content[0..300].gsub!('xmlns="http://www.tfl.gov.uk/tims/1.0"', "")

        puts "Parsing"
        source = XML::Parser.string(content)
        source.parse
      end


      def create_disruptions content
        disruptions = content.find("//Root/Disruptions/Disruption")
        disruptions.map do |disruption|
          Disruption.new(disruption)
        end
      end
    end
  end
end

