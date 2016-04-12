require "rails_helper"

RSpec.describe "GET /api/v1/items/1" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
  end

  it "returns data for an item" do
    item_one = create(:item, merchant_id: @merchant_one.id)

    get "/api/v1/items/1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>"Item One",
        "description"=>item_one.description,
        "unit_price"=>1000,
        "merchant_id"=>1
        })
  end
end
