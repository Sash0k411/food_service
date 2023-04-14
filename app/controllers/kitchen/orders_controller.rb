# frozen_string_literal: true

class Kitchen::OrdersController < ApplicationController
  def create
    result = KitchenOrderService.new.call

    render json: result, only: %i[name count]
  end
end
