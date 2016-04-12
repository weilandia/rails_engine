module Api
  module V1
    class ItemsController < ApiController
      def index
         @items = Item.all
      end
    end
  end
end
