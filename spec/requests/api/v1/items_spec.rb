require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
  end

  it "returns a list of all items" do
    item_one = create(:item, merchant_id: @merchant_one.id)
    item_two = create(:item, name: "Item Two", merchant_id: @merchant_two.id)

    get "/api/v1/items"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>1,
        "name"=>"Item One",
        "description"=>item_one.description,
        "unit_price"=>1000,
        "merchant_id"=>1
        })

    expect(item_two_json).to eq(
      { "id"=>item_two.id,
        "name"=>"Item Two",
        "description"=>"Item Factory",
        "unit_price"=>1000,
        "merchant_id"=>2
        })
  end
end
