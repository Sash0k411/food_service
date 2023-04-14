# frozen_string_literal: true

class Order::Create
  attr_reader :errors

  def initialize(rejected_ingredients)
    @rejected_ingredients = rejected_ingredients.map(&:to_i).reject(&:zero?)
    @errors = []
    @order_service = Order::Service.new(@rejected_ingredients)
  end

  def new
    @order = Order.new
  end

  def create(params)
    @order = Order.new(params[:order])
    @order.dishes = @order_service.call
    if @order.save
      true
    else
      @errors = @order.errors.full_messages
      false
    end
  end
end
