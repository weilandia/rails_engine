module Api
  module V1
    class InvoicesController < ApiController
      def index
        @invoices = Invoice.all
      end
    end
  end
end
