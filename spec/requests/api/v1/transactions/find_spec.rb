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
    @transaction_one = create(:transaction, invoice_id: @invoice_one.id, result: "failed")
    @transaction_two = create(:transaction, credit_card_number: "0000000000000000", invoice_id: @invoice_two.id)
  end

  it "finds the first transaction by id" do

    get "/api/v1/transactions/find?id=2"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "result"=>@transaction_two.result,
        "credit_card_number"=>"0000000000000000",
        "invoice_id"=>2
        })
  end

  it "finds the first tansaction by result" do

    get "/api/v1/transactions/find?result=failed"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)
    expect(json_body).to eq(
      { "id"=>1,
        "result"=>@transaction_one.result,
        "credit_card_number"=>"4242424242424242",
        "invoice_id"=>1
        })
  end

  it "finds the first transaction by cc number" do
    get "/api/v1/transactions/find?credit_card_number=4242424242424242"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "result"=>@transaction_one.result,
        "credit_card_number"=>"4242424242424242",
        "invoice_id"=>1
        })
  end

  it "finds the first transaction by invoice id" do

    get "/api/v1/transactions/find?invoice_id=2"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "result"=>@transaction_two.result,
        "credit_card_number"=>"0000000000000000",
        "invoice_id"=>2
        })
  end
end
