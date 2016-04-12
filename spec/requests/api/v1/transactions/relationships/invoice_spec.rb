require "rails_helper"

RSpec.describe "GET /api/v1/transactions/2/invoice" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @invoice_one = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_two = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @transaction_one = create(:transaction, invoice_id: @invoice_one.id, result: "failed")
    @transaction_two = create(:transaction, credit_card_number: "0000000000000000", invoice_id: @invoice_two.id, result: "failed")
  end

  it "returns data for transaction's invoice" do

    get "/api/v1/transactions/2/invoice"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "status"=>"Shipped",
        "customer_id"=>@customer.id,
        "merchant_id"=>1
        })
  end
end
