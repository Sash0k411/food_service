
require 'rails_helper'

RSpec.describe OrderService do
  describe '#call' do
    subject(:service) { described_class.new([excluded_ingredient.id]) }

    let(:ingredient) { create(:ingredient) }
    let(:excluded_ingredient) { create(:ingredient, name: 'Excluded ingredient') }
    let!(:good_dish) { create(:dish, ingredients: [ingredient]) }
    let!(:bad_dish) { create(:dish, name: 'Bad dish', ingredients: [ingredient, excluded_ingredient]) }

    it 'returns array of dishes without rejected ingredients' do
      expect(service.call).to eq([good_dish])
    end

    it 'returns array of all dishes if rejected ingredients not given' do
      expect(described_class.new([]).call).to eq([good_dish, bad_dish])
    end
  end
end