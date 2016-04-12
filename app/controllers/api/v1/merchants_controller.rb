module Api
  module V1
    class MerchantsController < ApiController
      def index
        @merchants = Merchant.all
      end
    end
  end
end
