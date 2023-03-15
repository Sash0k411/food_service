class Ingredient < ApplicationRecord
  has_many :original_ingredients, dependent: :destroy
  has_many :dishes, through: :original_ingredients

  validates :name, presence: true, uniqueness: true
end
