
class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
    @ingredients = Ingredient.order(:name)
  end

  def create
    @order = Order.new
    @order.dishes = OrderService.new(params[:order][:rejected_ingredients]).call

    if @order.save
      flash[:success] = 'Success save'
    else
      flash[:danger] = 'Fail at save'
    end

    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(rejected_ingredients: [])
  end
end