module Api
  module V1
    class CustomersController < ApiController
      def index
        @customers = Customer.all
      end

      def show
        @customer = Customer.find(params[:id])
      end

      def find
        @customer = Find.new(object)
      end
    end
  end
end
