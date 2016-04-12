module Api
  module V1
    class MerchantsController < ApiController
      def index
        @merchants = Merchant.all
      end

      def show
        @merchant = Merchant.find(params[:id])
      end
    end
  end
end
