
class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
    @ingredients = Ingredient.order(:name)
  end

  def create
    result = Order::Create.new(params[:order][:rejected_ingredients])
    if result.create(params[:order])
      flash[:success] = 'Success save'
    else
      flash[:danger] = 'Fail at save'
      @errors = result.errors
    end

    redirect_to root_path
  end
end