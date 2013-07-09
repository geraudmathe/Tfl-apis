module TflApis
  module Tims
    class Point
    	include SAXMachine
    	element :coordinatesEN
    	element :coordinatesLL

      def coordinates_ll
        @coordinatesLL.split(",")
      end

      def coordinates_en
        @coordinatesEN.split(",")
      end
    end

  end
end