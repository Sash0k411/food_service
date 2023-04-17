# frozen_string_literal: true

class CreateOriginalIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :original_ingredients do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
