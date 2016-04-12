require "rails_helper"

RSpec.describe "GET /api/v1/invoices/1/customer" do
  before(:each) do
    @customer_one = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @invoice_one = create(:invoice, customer_id: @customer_one.id, merchant_id: @merchant.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice_one.id)
  end

  it "returns data for an invoices's customer" do

    get "/api/v1/invoices/1/customer"
    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "first_name"=>@customer_one.first_name,
        "last_name"=>"One",
        })
  end
end
