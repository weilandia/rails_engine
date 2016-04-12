require "rails_helper"

RSpec.describe "GET /api/v1/customers/1/invoices" do
  before(:each) do
    @customer = create(:customer)
    @customer_two = create(:customer, last_name: "Two")
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice_one = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_two = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_three = create(:invoice, customer_id: @customer_two.id, merchant_id: @merchant.id)
  end

  it "returns index of customer's invoices" do

    get "/api/v1/customers/1/invoices"
    expect(response).to have_http_status("200")
    expect(json_body.class).to eq(Array)

    invoice_one_json = json_body.first
    invoice_two_json = json_body.last

    expect(invoice_one_json).to eq(
      { "id"=>@invoice_one.id,
        "status"=>"Shipped",
        "customer_id"=>@customer.id,
        "merchant_id"=>1
        })

    expect(invoice_two_json).to eq(
      { "id"=>2,
        "status"=>@invoice_two.status,
        "customer_id"=>@customer.id,
        "merchant_id"=>1
        })
  end
end
