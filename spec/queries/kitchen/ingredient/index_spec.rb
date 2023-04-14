# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kitchen::Ingredient::Index do
  describe '#call' do
    let!(:ingredient1) { create(:ingredient, name: 'Ingredient 1') }
    let!(:ingredient2) { create(:ingredient, name: 'Ingredient 2') }
    let!(:ingredient3) { create(:ingredient, name: 'Ingredient 3') }

    it 'returns ingredients ordered by name' do
      result = Kitchen::Ingredient::Index.new.call
      expect(result).to eq([ingredient1, ingredient2, ingredient3].sort_by(&:name))
    end
  end
end
