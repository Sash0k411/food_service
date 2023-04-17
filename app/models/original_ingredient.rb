# frozen_string_literal: true

class OriginalIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
