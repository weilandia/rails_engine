module Api
  module V1
    class CustomersController < ApiController
      def index
        @customers = Customer.all
      end
    end
  end
end
