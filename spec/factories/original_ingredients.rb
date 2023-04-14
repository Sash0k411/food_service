# frozen_string_literal: true

FactoryBot.define do
  factory :original_ingredient do
    dish
    ingredient
  end
end
