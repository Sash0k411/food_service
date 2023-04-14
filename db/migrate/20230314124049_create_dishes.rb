# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.string :ingredients, array: true

      t.timestamps
    end

    add_index :dishes, :name, unique: true
    add_index :dishes, :ingredients, using: 'gin'
  end
end
