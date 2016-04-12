require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/1" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
  end

  it "returns data for an invoice item" do
    invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)

    get "/api/v1/invoice_items/1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "quantity"=>10,
        "unit_price"=>invoice_item_one.unit_price,
        "item_id"=>1,
        "invoice_id"=>1
        })
  end
end
