require "rails_helper"

RSpec.describe "GET /api/v1/transactions" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @invoice_one = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice_one.id)
  end

  it "returns data for a transaction" do
    transaction_one = create(:transaction, invoice_id: @invoice_one.id, result: "failed")

    get "/api/v1/transactions/1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "result"=>transaction_one.result,
        "credit_card_number"=>"4242424242424242",
        "invoice_id"=>1
        })
  end
end
