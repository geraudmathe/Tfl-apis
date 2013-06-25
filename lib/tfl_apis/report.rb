require "xml"
require "pry"

module TflApis
  module Tims
    class Point
      attr_reader :coordinates_en, :coordinates_ll
      def initialize content
        @coordinates_en = content.find_first("coordinatesEN").content.split(",")
        @coordinates_ll = content.find_first("coordinatesLL").content.split(",")
      end
    end

    class Line
      attr_reader :en_beginning_point, :en_ending_point, :ll_beginning_point, :ll_ending_point

      def initialize content
        ll  = content.find_first("coordinatesLL").content.split(",")
        @ll_beginning_point = [ll[0],ll[1]]
        @ll_ending_point = [ll[2],ll[3]]
        en  = content.find_first("coordinatesEN").content.split(",")
        @en_beginning_point = [en[0],en[1]]
        @en_ending_point = [en[2],en[3]]
      end
    end

    class Link
      attr_reader :toid, :line
      def initialize content
        @toid = content.find_first("toid")
        @line = Line.new  content.find_first("Line")
      end
    end

    class Street
      attr_reader :name, :closure, :directions, :links
      def initialize content
        @name = content.find_first("name").content
        @closure = content.find_first("closure").content
        @directions = content.find_first("directions").content
        @links = []
        content.find("Link").each do |link|
          @links << Link.new(link)
        end
      end
    end

    class CauseArea
      attr_reader :display_point, :streets
      def initialize content
        @display_point = Point.new content.find_first("DisplayPoint/Point")
        @streets = []
        content.find("Streets/Street").each do |street|
          streets << Street.new(street)
        end
      end
    end



    class Disruption
      attr_accessor :location, :category, :sub_category, :severity, :status, :corridor, :level_of_interest, :start_time, :end_time, :comments, :currrent_update, :remark_time, :last_mod_time, :cause_area

      def initialize content
        root_attributes = {
          location: "location",
          category: "category",
          sub_category: "subCategory",
          severity: "severity",
          status:   "status",
          corridor: "corridor",
          level_of_interest: "levelOfInterest",
          start_time: "startTime",
          end_time: "endTime",
          comments: "comments",
          currrent_update: "currrentUpdate",
          remark_time: "remarkTime",
          last_mod_time: "lastModTime"
        }
        root_attributes.each do |key, attribute|
          val = content.find_first(attribute).content if content.find_first(attribute)
          self.send("#{key}=".to_sym, val)
        end

        @cause_area = CauseArea.new content.find_first("CauseArea")

      end
    end


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
        file = File.expand_path "../../../examples/stream.xml", __FILE__
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

