class CartsController < ApplicationController

  def show
    @cart = Cart.find_by_id(params[:id])
  end

  def update_quantity
    line_item = LineItem.find_by_id(params[:line_item].to_i)
    line_item.update quantity: params[:quantity].to_i
    render json: { updated_total_price: line_item.calculate_total_price }, status: 200
  end

end
