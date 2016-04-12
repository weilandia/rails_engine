require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find_all" do
  before(:each) do
    @customer_one = create(:customer)
    @customer_two = create(:customer, last_name: "Two")
    @merchant = create(:merchant)
    @invoice_one = create(:invoice, customer_id: @customer_one.id, merchant_id: @merchant.id)
    @invoice_two = create(:invoice, customer_id: @customer_two.id, merchant_id: @merchant.id, status: "destroyed")
    @invoice_three = create(:invoice, customer_id: @customer_two.id, merchant_id: @merchant.id, status: "destroyed")
  end

  it "finds all invoices with the same status" do
    get "/api/v1/invoices/find_all?status=DeStrOyEd"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_one_json = json_body.first
    invoice_two_json = json_body.last

    expect(invoice_one_json).to eq(
      { "id"=>@invoice_two.id,
        "status"=>"destroyed",
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })

    expect(invoice_two_json).to eq(
      { "id"=>3,
        "status"=>@invoice_three.status,
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })
  end

  it "finds all invoices with the same customer" do
    get "/api/v1/invoices/find_all?customer_id=2"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_one_json = json_body.first
    invoice_two_json = json_body.last

    expect(invoice_one_json).to eq(
      { "id"=>@invoice_two.id,
        "status"=>"destroyed",
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })

    expect(invoice_two_json).to eq(
      { "id"=>3,
        "status"=>@invoice_three.status,
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })
  end

  it "finds all invoices with the same merchant" do
    get "/api/v1/invoices/find_all?merchant_id=1"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(3)

    invoice_one_json = json_body.first
    invoice_two_json = json_body[1]
    invoice_three_json = json_body.last

    expect(invoice_one_json).to eq(
      { "id"=>@invoice_one.id,
        "status"=>"Shipped",
        "customer_id"=>@customer_one.id,
        "merchant_id"=>1
        })

    expect(invoice_two_json).to eq(
      { "id"=>2,
        "status"=>@invoice_two.status,
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })

    expect(invoice_three_json).to eq(
      { "id"=>3,
        "status"=>@invoice_three.status,
        "customer_id"=>@customer_two.id,
        "merchant_id"=>1
        })
  end
end
