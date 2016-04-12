json.array!(@merchants) do |merchant|
  json.(merchant, :id, :name)
end
