# frozen_string_literal: true

class Kitchen::Order::Index
  def call
    OrderItem.joins(:dish)
             .group('dishes.id')
             .select('dishes.name as name, COUNT(*) as count')
             .order('count DESC')
  end
end
