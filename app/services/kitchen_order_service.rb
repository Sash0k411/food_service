class KitchenOrderService

  def initialize
    @orders = Order.all
  end

  def call
    dishes = OrderItem.pluck(:dish_id).map { |id| Dish.find(id) }.group_by(&:name)
    counted = dishes.each_with_object([]) do |(k, v), arr|
      arr << { name: k, count: v.count }
    end

    counted.sort_by { |dish| dish[:count] }.reverse
  end
end