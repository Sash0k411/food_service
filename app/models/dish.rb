class Dish < ApplicationRecord
  has_many :original_ingredients, dependent: :destroy
  has_many :ingredients, through: :original_ingredients
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
end
