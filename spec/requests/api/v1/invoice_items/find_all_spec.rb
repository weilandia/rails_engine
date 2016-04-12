require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find_all" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    @invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)
    @invoice_item_three = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id, quantity: 100, unit_price: 500.00)
  end

  it "finds all invoice items with the same quantity" do

    get "/api/v1/invoice_items/find_all?quantity=10"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_item_one_json = json_body.first
    invoice_item_two_json = json_body.last

    expect(invoice_item_one_json).to eq(
      { "id"=>1,
        "quantity"=>10,
        "unit_price"=>@invoice_item_one.unit_price.to_s,
        "item_id"=>1,
        "invoice_id"=>1
        })

    expect(invoice_item_two_json).to eq(
      { "id"=>@invoice_item_two.id,
        "quantity"=>10,
        "unit_price"=>@invoice_item_two.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })
  end

  it "finds all invoice items with the same unit price" do

    get "/api/v1/invoice_items/find_all?unit_price=10.00"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_item_one_json = json_body.first
    invoice_item_two_json = json_body.last

    expect(invoice_item_one_json).to eq(
      { "id"=>1,
        "quantity"=>10,
        "unit_price"=>@invoice_item_one.unit_price.to_s,
        "item_id"=>1,
        "invoice_id"=>1
        })

    expect(invoice_item_two_json).to eq(
      { "id"=>@invoice_item_two.id,
        "quantity"=>10,
        "unit_price"=>@invoice_item_two.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })
  end

  it "finds all invoice items with the same item id" do

    get "/api/v1/invoice_items/find_all?item_id=2"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    invoice_item_two_json = json_body.first
    invoice_item_three_json = json_body.last

    expect(invoice_item_three_json).to eq(
      { "id"=>3,
        "quantity"=>100,
        "unit_price"=>@invoice_item_three.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })

    expect(invoice_item_two_json).to eq(
      { "id"=>@invoice_item_two.id,
        "quantity"=>10,
        "unit_price"=>@invoice_item_two.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })
  end

  it "finds all invoice items with the same invoice id" do

    get "/api/v1/invoice_items/find_all?invoice_id=1"

    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(3)

    invoice_item_one_json = json_body.first
    invoice_item_two_json = json_body[1]
    invoice_item_three_json = json_body.last


    expect(invoice_item_one_json).to eq(
      { "id"=>1,
        "quantity"=>10,
        "unit_price"=>@invoice_item_one.unit_price.to_s,
        "item_id"=>1,
        "invoice_id"=>1
        })

    expect(invoice_item_two_json).to eq(
      { "id"=>@invoice_item_two.id,
        "quantity"=>10,
        "unit_price"=>@invoice_item_two.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })

    expect(invoice_item_three_json).to eq(
      { "id"=>3,
        "quantity"=>100,
        "unit_price"=>@invoice_item_three.unit_price.to_s,
        "item_id"=>2,
        "invoice_id"=>1
        })
  end
end
