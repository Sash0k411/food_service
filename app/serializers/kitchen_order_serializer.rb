# frozen_string_literal: true

class KitchenOrderSerializer
  include ActiveModel::Serialization

  attr_accessor :name, :count

  def attributes
    { 'name' => object[:name], 'count' => object[:count] }
  end
end
