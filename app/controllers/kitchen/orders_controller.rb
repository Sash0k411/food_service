# frozen_string_literal: true

class Kitchen::OrdersController < ApplicationController
  def create
    result = Kitchen::Order::Index.new.call

    render json: result, only: %i[name count]
  end
end
