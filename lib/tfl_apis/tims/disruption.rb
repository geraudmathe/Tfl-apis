require "sax-machine"
module TflApis
  module Tims
    class Disruption
      include SAXMachine
      attribute :id
      element :location, as: :location
      element :category, as: :category
      element :subCategory, as: :sub_category
      element :severity, as: :severity
      element :status, as: :status 
      element :corridor, as: :corridor
      element :levelOfInterest, as: :level_of_interest
      element :startTime, as: :start_time
      element :endTime, as: :end_time
      element :comments, as: :comments
      element :currrentUpdate, as: :currrent_update
      element :remarkTime, as: :remark_time
      element :lastModTime, as: :last_mod_time
      element :CauseArea, as: :cause_area, class: CauseArea
    end
  end
end