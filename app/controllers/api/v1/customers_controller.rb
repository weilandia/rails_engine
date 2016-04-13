module Api
  module V1
    class CustomersController < ApiController
      before_action :set_customer, only: [:show, :transactions, :invoices]

      def index
        @customers = Customer.all
      end

      def show
      end

      def find
        @customer = Find.new(object)
      end

      def transactions
        @transactions = @customer.transactions.all
        render "api/v1/transactions/index"
      end

      def invoices
        @invoices = @customer.invoices.all
        render "api/v1/invoices/index"
      end

      def favorite_merchant
        @merchant = Merchant.favorite_merchant_by_customer(params[:id])
        render "api/v1/merchants/show"
      end

    private
      def set_customer
        @customer = Customer.find(params[:id])
      end
    end
  end
end
