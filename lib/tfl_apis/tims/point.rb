module TflApis
  module Tims
    class Point
      attr_reader :coordinates_en, :coordinates_ll
      def initialize content
        @coordinates_en = content.find_first("coordinatesEN").content.split(",")
        @coordinates_ll = content.find_first("coordinatesLL").content.split(",")
      end
    end
  end
end