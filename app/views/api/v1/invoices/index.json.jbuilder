json.array!(@invoices) do |invoice|
  json.(invoice, :id, :status, :customer_id, :merchant_id, :created_at, :updated_at)
end
