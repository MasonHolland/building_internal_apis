json.(@items) do |item|
  json.(item, :id, :name)
  json.num_orders(item.orders.count)
end
