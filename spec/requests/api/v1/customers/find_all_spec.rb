require "rails_helper"

RSpec.describe "GET /api/v1/customers/find_all" do
  it "finds all customers with same first name" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "Two")

    get "/api/v1/customers/find_all?first_name=cUsToMeR"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    customer_one_json = json_body.first
    customer_two_json = json_body.last

    expect(customer_one_json).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One",
        })

    expect(customer_two_json).to eq(
      { "id"=>2,
        "first_name"=>"Customer",
        "last_name"=>customer_two.last_name,
        })
  end

  it "finds all customers with same last name" do
    customer_one = create(:customer)
    create(:customer, last_name: "Two")
    customer_three = create(:customer, last_name: "One")

    get "/api/v1/customers/find_all?last_name=ONE"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    customer_one_json = json_body.first
    customer_three_json = json_body.last

    expect(customer_one_json).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One",
        })

    expect(customer_three_json).to eq(
      { "id"=>3,
        "first_name"=>"Customer",
        "last_name"=>customer_three.last_name,
        })
  end
end
