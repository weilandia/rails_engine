require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of all customers" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "two")

    get "/api/v1/customers"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    customer_one_json = json_body.first
    customer_two_json = json_body.last

    expect(customer_one_json).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One"
        })

    expect(customer_two_json).to eq(
      { "id"=>2,
        "first_name"=>"Customer",
        "last_name"=>customer_two.last_name
        })
  end
end
