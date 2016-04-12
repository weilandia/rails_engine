module Api
  module V1
    class TransactionsController < ApiController
      before_action :set_transaction, except: [:index]

      def index
        @transactions = Transaction.all
      end

      def show
      end

      def invoice
        @invoice = @transaction.invoice
        render "api/v1/invoices/show"
      end

    private
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end
    end
  end
end
