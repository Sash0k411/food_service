# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'associations' do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:dishes) }
  end
end
