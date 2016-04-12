require "rails_helper"

RSpec.describe "GET /api/v1/items/find" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
    @item_one = create(:item, merchant_id: @merchant_one.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant_two.id, description:"Test description.", unit_price:500.00)
  end

  it "finds the first item by id" do
    get "/api/v1/items/find?id=2"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds the first item by name" do
    get "/api/v1/items/find?name=iTeM ONE"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>"Item One",
        "description"=>@item_one.description,
        "unit_price"=>@item_one.unit_price.to_s,
        "merchant_id"=>1
        })
  end

  it "finds the first item by description" do
    get "/api/v1/items/find?description=Test description."

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds the first item by unit price" do
    get "/api/v1/items/find?unit_price=500.00"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "name"=>"Item Two",
        "description"=>@item_two.description,
        "unit_price"=>@item_two.unit_price.to_s,
        "merchant_id"=>2
        })
  end

  it "finds the first item by merchant id" do
    get "/api/v1/items/find?merchant_id=1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>"Item One",
        "description"=>@item_one.description,
        "unit_price"=>@item_one.unit_price.to_s,
        "merchant_id"=>1
        })
  end
end
