module TflApis
  module Tims
    class CauseArea
      include SAXMachine
      element :Point, as: :display_point, class: Point
      elements :Street, as: :streets, class: Street
    end
  end
end