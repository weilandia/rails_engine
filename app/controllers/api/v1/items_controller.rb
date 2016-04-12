module Api
  module V1
    class ItemsController < ApiController
      def index
         @items = Item.all
      end

      def show
        @item = Item.find(params[:id])
      end
    end
  end
end
