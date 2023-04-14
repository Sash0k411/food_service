# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kitchen::Order::Index do
  describe '#call' do
    let!(:dish1) { create(:dish, name: 'Dish 1') }
    let!(:dish2) { create(:dish, name: 'Dish 2') }

    before do
      create_list(:order_item, 3, dish: dish1)
      create_list(:order_item, 2, dish: dish2)
    end

    it 'returns a list of dishes with their count in descending order' do
      result = described_class.new.call

      expect(result.length).to eq(2)
      expect(result[0].name).to eq('Dish 1')
      expect(result[0].count).to eq(3)
      expect(result[1].name).to eq('Dish 2')
      expect(result[1].count).to eq(2)
    end
  end
end
