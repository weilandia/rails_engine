require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
    @merchant_three = create(:merchant, name: "Merchant Three")
  end

  it "finds the first invoice by id" do

    get "/api/v1/merchants/find?id=3"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>3,
        "name"=>@merchant_three.name
        })
  end

  it "finds the first invoice by name" do

    get "/api/v1/merchants/find?name=MerchanT TWO"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>2,
        "name"=>@merchant_two.name
        })
  end
end
