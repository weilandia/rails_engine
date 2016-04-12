module Api
  module V1
    class SearchesController < ApiController
      def find
        result = Find.new(params).locate_record
        instance_variable_set("@#{params["table"].singularize}", result)
        render  "api/v1/#{params["table"]}/show"
      end

      def find_all
        result = Find.new(params).locate_records
        instance_variable_set("@#{params["table"]}", result)
        render  "api/v1/#{params["table"]}/index"
      end

      def random
        result = Find.new(params).random
        instance_variable_set("@#{params["table"].singularize}", result)
        render  "api/v1/#{params["table"]}/show"
      end
    end
  end
end
