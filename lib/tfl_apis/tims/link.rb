module TflApis
  module Tims
    class Link
      attr_reader :toid, :line
      def initialize content
        @toid = content.find_first("toid")
        @line = Line.new  content.find_first("Line")
      end
    end
  end
end