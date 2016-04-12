module Api
  module V1
    class TransactionsController < ApiController
      def index
        @transactions = Transaction.all
      end

      def show
        @transaction = Transaction.find(params[:id])
      end
    end
  end
end
