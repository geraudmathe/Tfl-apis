module TflApis
  module Tims
    class Disruption
      attr_accessor :location, :category, :sub_category, :severity, :status, :corridor, :level_of_interest, :start_time, :end_time, :comments, :currrent_update, :remark_time, :last_mod_time, :cause_area

      def initialize content
        root_attributes = {
          location: "location",
          category: "category",
          sub_category: "subCategory",
          severity: "severity",
          status:   "status",
          corridor: "corridor",
          level_of_interest: "levelOfInterest",
          start_time: "startTime",
          end_time: "endTime",
          comments: "comments",
          currrent_update: "currrentUpdate",
          remark_time: "remarkTime",
          last_mod_time: "lastModTime"
        }
        root_attributes.each do |key, attribute|
          val = content.find_first(attribute).content if content.find_first(attribute)
          self.send("#{key}=".to_sym, val)
        end

        @cause_area = CauseArea.new content.find_first("CauseArea")

      end
    end
  end
end