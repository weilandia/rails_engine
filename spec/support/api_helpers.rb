module ApiHelpers
  def json_body
    body = JSON.parse(response.body)
    if body.class == Array
      body.map { |record| record.dup.except("created_at", "updated_at") }
    else
      body.dup.except("created_at", "updated_at")
    end
  end

  def merchant_business_intelligence_setup
    @customer = create(:customer)
    @merchant_one = create(:merchant)
    @merchant_two = create(:merchant, name: "Merchant Two")
    @merchant_three = create(:merchant, name: "Merchant Three")
    @item_one = create(:item, merchant_id: @merchant_one.id)
    @item_two = create(:item, name: "Item Two", merchant_id: @merchant_two.id)
    @item_three = create(:item, name: "Item Two", merchant_id: @merchant_three.id)
    @invoice_one = create(:invoice, customer_id: @customer.id, merchant_id: @merchant_one.id)
    @invoice_two = create(:invoice, customer_id: @customer.id, merchant_id: @merchant_two.id)
    @invoice_three = create(:invoice, customer_id: @customer.id, merchant_id: @merchant_three.id)
    @invoice_item_one = create(:invoice_item, item_id: @item_one.id, invoice_id: @invoice_one.id, unit_price: 10.00)
    @invoice_item_two = create(:invoice_item, item_id: @item_two.id, invoice_id: @invoice_two.id, unit_price: 1000.00)
    @invoice_item_three = create(:invoice_item, item_id: @item_three.id, invoice_id: @invoice_three, unit_price: 10000.00)
    @transaction_one = create(:transaction, invoice_id: @invoice_one.id)
    @transaction_two = create(:transaction, invoice_id: @invoice_two.id)
    @transaction_three = create(:transaction, invoice_id: @invoice_three.id, result: "Failed")
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
