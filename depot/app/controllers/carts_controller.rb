class CartsController < ApplicationController

  def show
    debugger
    @carts = params[:id].carts.select("id")
  end

end
