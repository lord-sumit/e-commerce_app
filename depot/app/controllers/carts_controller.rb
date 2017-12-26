class CartsController < ApplicationController

  def show
    @cart = Cart.find_by_id(params[:id])
  end

  def update_quantity
    debugger
    render json: { updated_total_price: @line_item.calculate_total_price }, status: 200
  end

end
