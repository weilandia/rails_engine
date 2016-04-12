require "rails_helper"

RSpec.describe "GET /api/v1/customers/find" do
  it "finds the first customer by id" do
    customer_one = create(:customer)
    create(:customer, last_name: "Two")
    create(:customer, last_name: "Three")

    get "/api/v1/customers/find?id=1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One"
        })
  end

  it "finds the first customer by first name" do
    customer_one = create(:customer)
    create(:customer, last_name: "Two")
    create(:customer, last_name: "Three")

    get "/api/v1/customers/find?first_name=customer"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One"
        })
  end

  it "finds the first customer by first name with weird case" do
    customer_one = create(:customer)
    create(:customer, last_name: "Two")
    create(:customer, last_name: "Three")

    get "/api/v1/customers/find?first_name=cuStOmeR"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "first_name"=>customer_one.first_name,
        "last_name"=>"One"
        })
  end

  it "finds the first customer by last name" do
    create(:customer)
    create(:customer, last_name: "Two")
    customer_three = create(:customer, last_name: "Three")

    get "/api/v1/customers/find?last_name=three"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>3,
        "first_name"=>customer_three.first_name,
        "last_name"=>"Three"
        })
  end

  it "finds the first customer by last name with weird case" do
    create(:customer)
    customer_two = create(:customer, last_name: "Two")
    create(:customer, last_name: "Three")

    get "/api/v1/customers/find?last_name=TwO"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)
    expect(json_body).to eq(
      { "id"=>2,
        "first_name"=>"Customer",
        "last_name"=>customer_two.last_name
        })
  end
end
