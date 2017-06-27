class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number, :num_items

  has_many :items

  def num_items
    object.items.count
  end
end
