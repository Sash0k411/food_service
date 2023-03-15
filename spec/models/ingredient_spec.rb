
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'associations' do
    it { should have_many(:original_ingredients).dependent(:destroy) }
    it { should have_many(:dishes) }
  end

  describe 'validations' do
    subject(:ingredient) { create(:ingredient) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end