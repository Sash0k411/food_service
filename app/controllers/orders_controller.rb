# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
    @ingredients = Kitchen::Ingredient::Index.new.call
  end

  def create
    result = Order::Create.new(params[:order][:rejected_ingredients])
    if result.create(params[:order])
      flash[:success] = 'Success save'
      redirect_to root_path
    else
      flash[:danger] = 'Fail at save'
      @errors = result.errors
    end
  end
end
