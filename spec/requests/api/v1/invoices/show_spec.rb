require "rails_helper"

RSpec.describe "GET /api/v1/invoices/1" do
  before(:each) do
    @customer_one = create(:customer)
    @customer_two = create(:customer, last_name: "Two")
    @merchant = create(:merchant)
  end

  it "returns data for an invoice" do
    invoice_one = create(:invoice, customer_id: @customer_one.id, merchant_id: @merchant.id)

    get "/api/v1/invoices/1"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "status"=>"Shipped",
        "customer_id"=>invoice_one.id,
        "merchant_id"=>1
        })
  end
end
