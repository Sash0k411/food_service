# frozen_string_literal: true

class Order::Create
  attr_reader :errors

  def initialize(rejected_ingredients)
    @rejected_ingredients = rejected_ingredients.map(&:to_i).reject(&:zero?)
    @errors = []
  end

  def new
    @order = Order.new
  end

  def create(params)
    @order = Order.new(params[:order])
    @order.dishes = Dish.where.not(id: rejected_dishes.ids)
    if @order.save
      true
    else
      @errors = @order.errors.full_messages
      false
    end
  end

  private

  def rejected_dishes
    Dish.includes(:original_ingredients).where(original_ingredients: { ingredient_id: @rejected_ingredients })
  end
end
