module TflApis
  module Tims
    class Link
      include SAXMachine
      element :toid, as: :to_id
      element :Line, as: :line, class: Line
    end
  end
end