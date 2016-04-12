require "rails_helper"

RSpec.describe "GET /api/v1/invoices/1/items" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    @invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)
  end

  it "returns a list of all items" do

    get "/api/v1/invoices/1/items"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>1,
        "name"=>"Item One",
        "description"=>@item_one.description,
        "unit_price"=>@item_one.unit_price.to_s,
        "merchant_id"=>1
        })

    expect(item_two_json).to eq(
      { "id"=>@item_two.id,
        "name"=>"Item Two",
        "description"=>"Item Factory",
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>1
        })
  end
end
