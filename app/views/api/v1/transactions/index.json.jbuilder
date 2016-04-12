json.array!(@transactions) do |transaction|
  json.(transaction, :id, :result, :credit_card_number, :invoice_id, :created_at, :updated_at)
end
