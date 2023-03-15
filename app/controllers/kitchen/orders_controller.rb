class Kitchen::OrdersController < ApplicationController
  def create
    result = KitchenOrderService.new.call

    render json: result
  end
end