json.array!(@transactions) do |transaction|
  json.(transaction, :id, :result, :credit_card_number, :credit_card_expiration_date, :invoice_id, :created_at, :updated_at)
end
