json.array!(@customers) do |customer|
  json.(customer, :id, :first_name, :last_name, :created_at, :updated_at)
end
