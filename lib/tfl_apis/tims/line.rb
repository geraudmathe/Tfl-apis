module TflApis
  module Tims
    class Line
      include SAXMachine
      element :coordinatesEN
      element :coordinatesLL

      def beginning_point_ll
        ll = @coordinatesLL.split(",")
        [ll[0],ll[1]]
      end

      def ending_point_ll
        ll = @coordinatesLL.split(",")
        [ll[2],ll[3]]
      end

      def beginning_point_en
        en = @coordinatesEN.split(",")
        [en[0],en[1]]
      end

      def ending_point_en
        en = @coordinatesEN.split(",")
        [en[2],en[3]]
      end
        
    end
  end
end