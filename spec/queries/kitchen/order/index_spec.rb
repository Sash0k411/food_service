# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kitchen::Order::Index do
  describe '#call' do
    let(:dish1) { create(:dish, name: 'Dish 1') }
    let(:dish2) { create(:dish, name: 'Dish 2') }
    let!(:order_item1) { create(:order_item, dish: dish1) }
    let!(:order_item2) { create(:order_item, dish: dish1) }
    let!(:order_item3) { create(:order_item, dish: dish2) }

    it 'returns a list of order items grouped by dish with counts in descending order' do
      result = Kitchen::Order::Index.new.call

      expect(result.length).to eq(2)
      expect(result[0].name).to eq('Dish 1')
      expect(result[0].count).to eq(2)
      expect(result[1].name).to eq('Dish 2')
      expect(result[1].count).to eq(1)
    end
  end
end
