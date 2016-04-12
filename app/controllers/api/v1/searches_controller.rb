module Api
  module V1
    class SearchesController < ApiController
      def find
        result = Find.new(params).locate_record
        instance_variable_set("@#{params["table"].singularize}", result)
        render  "api/v1/#{params["table"]}/show"
      end
    end
  end
end
