module TflApis
  module Tims
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
  end
end