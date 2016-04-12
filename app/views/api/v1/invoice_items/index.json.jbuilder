json.array!(@invoice_items) do |invoice_item|
  json.(invoice_item, :id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
end
