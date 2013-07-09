module TflApis
  module Tims
    class Street
      include SAXMachine 
      element :name
      element :closure
      element :directions
      elements :Link, as: :links, class: Link
    end
  end
end