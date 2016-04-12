module Api
  module V1
    class InvoicesController < ApiController
      before_action :set_invoice, except: [:index]

      def index
        @invoices = Invoice.all
      end

      def show
      end

      def customer
        @customer = @invoice.customer
        render "api/v1/customers/show"
      end

      def merchant
        @merchant = @invoice.merchant
        render "api/v1/merchants/show"
      end

      def invoice_items
        @invoice_items = @invoice.invoice_items
        render "api/v1/invoice_items/index"
      end

      def items
        @items = @invoice.items
        render "api/v1/items/index"
      end

      def transactions
        @transactions = @invoice.transactions
        render "api/v1/transactions/index"
      end

    private
      def set_invoice
        @invoice = Invoice.find(params[:id])
      end
    end
  end
end
