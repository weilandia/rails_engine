require "rails_helper"

RSpec.describe "GET /api/v1/transactions" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice_one = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_two = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice_one.id)
    @invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice_two.id)
  end

  it "returns a list of all transactions" do
    transaction_one = create(:transaction, invoice_id: @invoice_one.id, result: "failed")

    transaction_two = create(:transaction, credit_card_number: "0000000000000000", invoice_id: @invoice_two.id)

    get "/api/v1/transactions"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    transaction_one_json = json_body.first
    transaction_two_json = json_body.last

    expect(transaction_one_json).to eq(
      { "id"=>1,
        "result"=>transaction_one.result,
        "credit_card_number"=>"4242424242424242",
        "invoice_id"=>1
        })

    expect(transaction_two_json).to eq(
      { "id"=>transaction_two.id,
        "result"=>"success",
        "credit_card_number"=>"0000000000000000",
        "invoice_id"=>2
        })
  end
end
