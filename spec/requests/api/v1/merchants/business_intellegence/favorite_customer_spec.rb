require "rails_helper"

RSpec.describe "GET /api/v1/merchants/1/favorite_customer" do
  before(:each) do
    merchant_business_intelligence_setup
  end

  it "returns favorite customer for merchant by total successful transaction count" do

    get "/api/v1/merchants/1/favorite_customer"
    
    expect(response).to have_http_status("200")
    expect(json_body).to eq(
    { "id"=>1,
      "first_name"=>"Customer",
      "last_name"=>"One",
      })
  end
end
