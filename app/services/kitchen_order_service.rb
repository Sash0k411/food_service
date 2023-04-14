# frozen_string_literal: true

class KitchenOrderService
  def call
    OrderItem.joins(:dish)
             .group('dishes.name')
             .select('dishes.name as name, COUNT(*) as count')
  end
end
