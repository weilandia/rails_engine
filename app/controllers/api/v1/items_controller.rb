module Api
  module V1
    class ItemsController < ApiController
      before_action :set_item, except: [:index, :most_revenue, :most_items]
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

      def most_revenue
        @items = Item.most_revenue(params[:quantity])
        render "api/v1/items/index"
      end

      def most_items
        @items = Item.most_items(params[:quantity])
        render "api/v1/items/index"
      end

      def best_day
        @date = Item.best_day(@item.id)
      end

    private
      def set_item
        @item = Item.find(params[:id])
      end
    end
  end
end
