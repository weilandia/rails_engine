module Api
  module V1
    class ItemsController < ApiController
      before_action :set_item, except: [:index]
      def index
         @items = Item.all
      end

      def show
      end

      def merchant
        @merchant = @item.merchant
        render "api/v1/merchants/show"
      end

      def invoice_items
        @invoice_items = @item.invoice_items
        render "api/v1/invoice_items/index"
      end

    private
      def set_item
        @item = Item.find(params[:id])
      end
    end
  end
end
