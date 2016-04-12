require "rails_helper"

RSpec.describe "GET /api/v1/items/find_all" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
    @item_one = create(:item, merchant_id: @merchant_one.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant_two.id, description:"Test description.", unit_price:500.00)
    @item_three = create(:item, name: "Item Two", merchant_id: @merchant_two.id, description:"Test description.", unit_price:500.00)
  end

  it "finds all items with the same name" do

    get "/api/v1/items/find_all?name=IteM TwO"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })

    expect(item_two_json).to eq(
      { "id"=>@item_three.id,
        "name"=>"Item Two",
        "description"=>"Test description.",
        "unit_price"=>@item_three.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds all items with the same name" do

    get "/api/v1/items/find_all?description=TeSt deScripTION."

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })

    expect(item_two_json).to eq(
      { "id"=>@item_three.id,
        "name"=>"Item Two",
        "description"=>"Test description.",
        "unit_price"=>@item_three.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds all items with the same unit price" do

    get "/api/v1/items/find_all?unit_price=500.00"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })

    expect(item_two_json).to eq(
      { "id"=>@item_three.id,
        "name"=>"Item Two",
        "description"=>"Test description.",
        "unit_price"=>@item_three.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds all items with the same merchant" do

    get "/api/v1/items/find_all?merchant_id=2"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    item_one_json = json_body.first
    item_two_json = json_body.last

    expect(item_one_json).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })

    expect(item_two_json).to eq(
      { "id"=>@item_three.id,
        "name"=>"Item Two",
        "description"=>"Test description.",
        "unit_price"=>@item_three.unit_price.to_s,
        "merchant_id"=>2
        })
  end
end
