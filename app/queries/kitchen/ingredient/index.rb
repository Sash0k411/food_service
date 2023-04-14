# frozen_string_literal: true

class Kitchen::Ingredient::Index
  def call
    Ingredient.order(:name)
  end
end
