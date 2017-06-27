class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_orders

  def num_orders
    object.orders.count
  end
end
