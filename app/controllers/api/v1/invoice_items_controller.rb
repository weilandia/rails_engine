module Api
  module V1
    class InvoiceItemsController < ApiController
      def index
        @invoice_items = InvoiceItem.all
      end
    end
  end
end
