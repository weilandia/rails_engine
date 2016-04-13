require "rails_helper"

RSpec.describe "GET /api/v1/merchants/most_items" do
  before(:each) do
    merchant_business_intelligence_setup
    @invoice_item_four = create(:invoice_item, item_id: @item_three.id, invoice_id: 3, unit_price: 0)
    @invoice_item_five = create(:invoice_item, item_id: @item_three.id, invoice_id: 3, unit_price: 10)
    @invoice_item_six = create(:invoice_item, item_id: @item_three.id, invoice_id: 3, unit_price: 10)
    @invoice_item_seven = create(:invoice_item, item_id: @item_three.id, invoice_id: 1, unit_price: 0)
    @transaction_four = create(:transaction, invoice_id: 3)
  end

  it "returns top 2 merchants ranked by total items sold" do

    get "/api/v1/merchants/most_items?quantity=2"
    expect(response).to have_http_status("200")
    expect(json_body.count).to eq(2)

    merchant_one_json = json_body.first
    merchant_two_json = json_body.last

    expect(merchant_one_json).to eq(
      { "id"=>3,
        "name"=>@merchant_three.name
        })

    expect(merchant_two_json).to eq(
      { "id"=>@merchant_one.id,
        "name"=>"Merchant One"
        })
  end
end
