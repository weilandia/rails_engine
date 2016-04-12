json.array!(@merchants) do |merchant|
  json.(merchant, :id, :name, :created_at, :updated_at)
end
