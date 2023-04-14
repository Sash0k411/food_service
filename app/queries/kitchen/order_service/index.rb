# frozen_string_literal: true

class Kitchen::OrderService::Index
  def call
    order_item_ids = OrderItem.pluck(:dish_id)
    Dish.includes(:order_items).where(id: order_item_ids).group_by(&:name)
  end
end
