# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KitchenOrderService do
  describe '#call' do
    subject(:service) { described_class.new }

    let(:dish1) { create(:dish, name: 'Dish 1', ingredients: [create(:ingredient, name: 'ingredient 1')]) }
    let(:dish2) { create(:dish, name: 'Dish 2', ingredients: [create(:ingredient, name: 'ingredient 2')]) }
    let(:dish3) { create(:dish, name: 'Dish 3', ingredients: [create(:ingredient, name: 'ingredient 3')]) }

    before do
      create(:order, dishes: [dish1, dish2])
      create(:order, dishes: [dish2, dish3])
      create(:order, dishes: [dish2, dish3])
    end

    it 'returns array of dishes, sorted by count' do
      result = [
        { name: dish2.name, count: 3 },
        { name: dish3.name, count: 2 },
        { name: dish1.name, count: 1 }
      ]

      expect(service.call).to eq(result)
    end
  end
end
