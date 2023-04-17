# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_314_124_829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'dishes', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'ingredients', array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredients'], name: 'index_dishes_on_ingredients', using: :gin
    t.index ['name'], name: 'index_dishes_on_name', unique: true
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_ingredients_on_name', unique: true
  end

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'dish_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['dish_id'], name: 'index_order_items_on_dish_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'original_ingredients', force: :cascade do |t|
    t.bigint 'dish_id', null: false
    t.bigint 'ingredient_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['dish_id'], name: 'index_original_ingredients_on_dish_id'
    t.index ['ingredient_id'], name: 'index_original_ingredients_on_ingredient_id'
  end

  add_foreign_key 'order_items', 'dishes'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'original_ingredients', 'dishes'
  add_foreign_key 'original_ingredients', 'ingredients'
end
