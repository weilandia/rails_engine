require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item_one = create(:item, merchant_id: @merchant.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant.id)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
  end

  it "finds the first invoice item by id" do
    invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)

    get "/api/v1/invoice_items/find?id=1"

    expect(json_body).to eq(
      { "id"=>invoice_item_one.id,
        "quantity"=>10,
        "unit_price"=>invoice_item_one.unit_price.to_s,
        "item_id"=>invoice_item_one.item_id,
        "invoice_id"=>1
        })
  end

  it "finds the first invoice item by quantity" do
    create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id, quantity: 50)

    get "/api/v1/invoice_items/find?quantity=50"

    expect(json_body).to eq(
      { "id"=>invoice_item_two.id,
        "quantity"=>invoice_item_two.quantity,
        "unit_price"=>invoice_item_two.unit_price.to_s,
        "item_id"=>invoice_item_two.item_id,
        "invoice_id"=>1
        })
  end

  it "finds the first invoice item by unit price" do
    create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id, unit_price: 50.00)

    get "/api/v1/invoice_items/find?unit_price=50.00"

    expect(json_body).to eq(
      { "id"=>invoice_item_two.id,
        "quantity"=>invoice_item_two.quantity,
        "unit_price"=>invoice_item_two.unit_price.to_s,
        "item_id"=>invoice_item_two.item_id,
        "invoice_id"=>1
        })
  end

  it "finds the first invoice item by item id" do
    create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)

    get "/api/v1/invoice_items/find?item_id=2"

    expect(json_body).to eq(
      { "id"=>invoice_item_two.id,
        "quantity"=>invoice_item_two.quantity,
        "unit_price"=>invoice_item_two.unit_price.to_s,
        "item_id"=>invoice_item_two.item_id,
        "invoice_id"=>1
        })
  end

  it "finds the first invoice item by invoice id" do
    invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice.id)
    create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice.id)

    get "/api/v1/invoice_items/find?invoice_id=1"

    expect(json_body).to eq(
      { "id"=>invoice_item_one.id,
        "quantity"=>10,
        "unit_price"=>invoice_item_one.unit_price.to_s,
        "item_id"=>invoice_item_one.item_id,
        "invoice_id"=>1
        })
  end
end
