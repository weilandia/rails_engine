require "rails_helper"

RSpec.describe "GET /api/v1/items/1/merchant" do
  before(:each) do
    @customer_one = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two= create(:item, name: "Item Two", merchant_id: @merchant.id)
  end

  it "returns data for an item's merchant" do

    get "/api/v1/items/1/merchant"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>@merchant.name
        })
  end
end
