require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
  end

  it "returns a list of all invoice items" do
    invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)

    invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)

    get "/api/v1/invoice_items"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_item_one_json = json_body.first
    invoice_item_two_json = json_body.last

    expect(invoice_item_one_json).to eq(
      { "id"=>1,
        "quantity"=>10,
        "unit_price"=>invoice_item_one.unit_price,
        "item_id"=>1,
        "invoice_id"=>1
        })

    expect(invoice_item_two_json).to eq(
      { "id"=>invoice_item_two.id,
        "quantity"=>10,
        "unit_price"=>1000,
        "item_id"=>2,
        "invoice_id"=>1
        })
  end
end