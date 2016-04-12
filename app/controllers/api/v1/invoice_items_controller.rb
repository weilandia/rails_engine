module Api
  module V1
    class InvoiceItemsController < ApiController
      def index
        @invoice_items = InvoiceItem.all
      end

      def show
        @invoice_item = InvoiceItem.find(params[:id])
      end
    end
  end
end
