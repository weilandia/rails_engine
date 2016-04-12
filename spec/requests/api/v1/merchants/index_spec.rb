require "rails_helper"

RSpec.describe "GET /api/v1/merchants" do
  it "returns a list of all merchants" do
    merchant_one = create(:merchant)
    merchant_two = create(:merchant, name: "Merchant Two")

    get "/api/v1/merchants"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    merchant_one_json = json_body.first
    merchant_two_json = json_body.last

    expect(merchant_one_json).to eq(
      { "id"=>1,
        "name"=>merchant_one.name
        })

    expect(merchant_two_json).to eq(
      { "id"=>merchant_two.id,
        "name"=>"Merchant Two"
        })
  end
end
