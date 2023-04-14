# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kitchen::OrdersController do
  describe 'POST #create' do
    let(:dish1) { create(:dish, name: 'Dish 1', ingredients: [create(:ingredient, name: 'ingredient 1')]) }
    let(:dish2) { create(:dish, name: 'Dish 2', ingredients: [create(:ingredient, name: 'ingredient 2')]) }
    let(:dish3) { create(:dish, name: 'Dish 3', ingredients: [create(:ingredient, name: 'ingredient 3')]) }

    before do
      create(:order, dishes: [dish1, dish2])
      create(:order, dishes: [dish2, dish3])
      create(:order, dishes: [dish2, dish3])

      post :create
    end

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns json with orders dishes summary' do
      json = [
        { 'name' => dish2.name, 'count' => 3 },
        { 'name' => dish3.name, 'count' => 2 },
        { 'name' => dish1.name, 'count' => 1 }
      ]

      expect(JSON.parse(response.body)).to eq(json)
    end
  end
end
