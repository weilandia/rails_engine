require "rails_helper"

RSpec.describe "GET /api/v1/merchants/1" do
  it "returns data for a merchant" do
    merchant_one = create(:merchant)

    get "/api/v1/merchants/1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>merchant_one.name
        })
  end
end
