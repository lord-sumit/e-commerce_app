class CartsController < ApplicationController

  def show
    @carts = params[:id].carts.select("id")
  end

end
