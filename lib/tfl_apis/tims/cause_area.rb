module TflApis
  module Tims
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
  end
end