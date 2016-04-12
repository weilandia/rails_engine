require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find" do
  before(:each) do
    @customer_one = create(:customer)
    @customer_two = create(:customer, last_name: "Two")
    @merchant = create(:merchant)
    @invoice_one = create(:invoice, customer_id: @customer_one.id, merchant_id: @merchant.id)
    @invoice_two = create(:invoice, customer_id: @customer_two.id, merchant_id: @merchant.id, status: "destroyed")
  end

  it "finds the first invoice by id" do
    get "/api/v1/invoices/find?id=1"

    expect(response).to have_http_status("200")

    expect(json_body).to eq(
      { "id"=>1,
        "status"=>"Shipped",
        "customer_id"=>@customer_one.id,
        "merchant_id"=>1
        })
  end

  it "finds the first invoice by status" do
    get "/api/v1/invoices/find?status=desTroYeD"

    expect(response).to have_http_status("200")

    expect(json_body).to eq(
      { "id"=>2,
        "status"=>"destroyed",
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })
  end

  it "finds the first invoice by customer id" do
    get "/api/v1/invoices/find?customer_id=1"

    expect(response).to have_http_status("200")

    expect(json_body).to eq(
      { "id"=>1,
        "status"=>"Shipped",
        "customer_id"=>@customer_one.id,
        "merchant_id"=>1
        })
  end

  it "finds the first invoice by merchant id" do
    get "/api/v1/invoices/find?merchant_id=1"

    expect(response).to have_http_status("200")
    expect(json_body).to eq(
      { "id"=>1,
        "status"=>"Shipped",
        "customer_id"=>@customer_one.id,
        "merchant_id"=>1
        })
  end
end
