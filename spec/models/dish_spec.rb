# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish do
  describe 'associations' do
    it { should have_many(:original_ingredients).dependent(:destroy) }
    it { should have_many(:ingredients) }
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:orders) }
  end

  describe 'validations' do
    subject(:dish) { create(:dish) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
