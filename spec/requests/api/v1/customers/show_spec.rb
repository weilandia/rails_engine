require "rails_helper"

RSpec.describe "GET /api/v1/customers/1" do
  it "returns data for a customer" do
    customer_one = create(:customer)

    get "/api/v1/customers/1"
    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One",
        })
  end
end
