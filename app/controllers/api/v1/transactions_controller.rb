module Api
  module V1
    class TransactionsController < ApiController
      def index
        @transactions = Transaction.all
      end
    end
  end
end
