if @revenue.first == "total_revenue"
  json.total_revenue(@revenue.last)
else
  json.revenue("#{@revenue.last}")
end
