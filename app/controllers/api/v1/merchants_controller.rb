module Api
  module V1
    class MerchantsController < ApiController
      before_action :set_merchant, only: [:show, :invoices, :items]

      def index
        @merchants = Merchant.all
      end

      def show
      end

      def invoices
        @invoices = @merchant.invoices.all
        render "api/v1/invoices/index"
      end

      def items
        @items = @merchant.items.all
        render "api/v1/items/index"
      end

    private
      def set_merchant
        @merchant = Merchant.find(params[:id])
      end
    end
  end
end
