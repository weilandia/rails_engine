require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find_all" do
  before(:each) do
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
    @merchant_three = create(:merchant, name: "Merchant Two")
  end

  it "finds all merchants with the same name" do

    get "/api/v1/merchants/find_all?name=MeRcHaNt TWO"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    merchant_one_json = json_body.first
    merchant_two_json = json_body.last

    expect(merchant_one_json).to eq(
      { "id"=>2,
        "name"=>@merchant_two.name
        })

    expect(merchant_two_json).to eq(
      { "id"=>@merchant_three.id,
        "name"=>"Merchant Two"
        })
  end
end
