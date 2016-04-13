module Api
  module V1
    class MerchantsController < ApiController
      before_action :set_merchant, only: [:show, :invoices, :items, :favorite_customer]

      def index
        @merchants = Merchant.all
      end

      def show
      end

      def invoices
        @invoices = @merchant.invoices.all
        render "api/v1/invoices/index"
      end

      def items
        @items = @merchant.items.all
        render "api/v1/items/index"
      end

      def most_revenue
        @merchants = Merchant.most_revenue(params[:quantity])
        render "api/v1/merchants/index"
      end

      def most_items
        @merchants = Merchant.most_items(params[:quantity])
        render "api/v1/merchants/index"
      end

      def revenue
        @revenue = RevenueFinder.new(params).find_revenue
      end

      def favorite_customer
        @customer = Customer.favorite_customer_by_merchant(params[:id])
        render "api/v1/customers/show"
      end

      def customers_with_pending_invoices
        @customers = Customer.customers_with_pending_invoices_by_merchant(params[:id])
        render "api/v1/customers/index"
      end

    private
      def set_merchant
        @merchant = Merchant.find(params[:id])
      end
    end
  end
end
