require "rails_helper"

RSpec.describe "GET /api/v1/invoices/1/merchant" do
  before(:each) do
    @customer_one = create(:customer)
    @merchant = create(:merchant)
    @invoice_one = create(:invoice, customer_id: @customer_one.id, merchant_id: @merchant.id)
  end

  it "returns data for an invoice's merchant" do

    get "/api/v1/invoices/1/merchant"

    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Hash)

    expect(json_body).to eq(
      { "id"=>1,
        "name"=>@merchant.name
        })
  end
end
