
class OrderService
  def initialize(rejected_ingredients)
    @rejected_ingredients = rejected_ingredients.map(&:to_i).reject(&:zero?)
  end

  def call
    Dish.where.not(id: rejected_dishes.ids)
  end

  private

  def rejected_dishes
    Dish.joins(:original_ingredients)
        .where(original_ingredients: { ingredient_id: @rejected_ingredients })
  end
end