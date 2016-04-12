module Api
  module V1
    class InvoiceItemsController < ApiController
      before_action :set_invoice_item, only: [:show, :item, :invoice]

      def index
        @invoice_items = InvoiceItem.all
      end

      def show
      end

      def item
        @item = @invoice_item.item
        render "api/v1/items/show"
      end

      def invoice
        @invoice = @invoice_item.invoice
        render "api/v1/invoices/show"
      end

    private
      def set_invoice_item
        @invoice_item = InvoiceItem.find(params[:id])
      end
    end
  end
end
