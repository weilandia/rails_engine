json.array!(@items) do |item|
  json.(item, :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
end
