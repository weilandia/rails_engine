require "rails_helper"

RSpec.describe "GET /api/v1/merchants/most_revenue" do
  before(:each) do
    merchant_business_intelligence_setup
  end

  it "returns top 2 merchants ranked by total revenue" do

    get "/api/v1/merchants/most_revenue?quantity=2"
    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    merchant_one_json = json_body.first
    merchant_two_json = json_body.last

    expect(merchant_one_json).to eq(
      { "id"=>2,
        "name"=>@merchant_two.name
        })

    expect(merchant_two_json).to eq(
      { "id"=>@merchant_one.id,
        "name"=>"Merchant One"
        })
  end
end
