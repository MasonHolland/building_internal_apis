json.(@item, :id, :order_number)
json.num_items(@item.item.count)
json.orders @item.orders do |order|
  json.(order, :id)
end
