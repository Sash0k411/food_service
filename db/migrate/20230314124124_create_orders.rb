# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status, default: :in_progress

      t.timestamps
    end
    add_reference :order_items, :order, null: false, foreign_key: true
  end
end
