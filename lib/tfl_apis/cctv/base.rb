require "tfl_apis/cctv/camera"
module TflApis
  module CCTV
    class Report
      include SAXMachine
      element :header
      elements :camera, as: :cameras, class: Camera
    end
  end
end