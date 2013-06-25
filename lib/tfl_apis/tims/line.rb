module TflApis
  module Tims
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
  end
end