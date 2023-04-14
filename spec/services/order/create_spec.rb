# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'rejected ingredients query' do
    let!(:rejected_ingredient) { create(:original_ingredient) }
    let!(:dish_with_rejected_ingredient) { create(:dish) }

    before do
      dish_with_rejected_ingredient.original_ingredients << rejected_ingredient
    end

    it 'returns dishes with rejected ingredients' do
      rejected_ingredients = [rejected_ingredient.ingredient_id]
      dishes = Dish.includes(:original_ingredients).where(original_ingredients: { ingredient_id: rejected_ingredients })
      expect(dishes).to include(dish_with_rejected_ingredient)
    end
  end
end
