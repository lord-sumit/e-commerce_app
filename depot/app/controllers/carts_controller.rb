class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to @cart
  end

  def update
    @cart = Cart.find_by(params[:id])
    if @cart.update(cart_params)
      redirect_to @cart
    else
      render 'edit'
    end
  end

  def destroy
    @cart = Cart.find_by_id(params[:id])
    @cart.destroy
    redirect_to @carts
  end

  private
    def cart_params
      params.require(:cart)
        .permit(:name, :color, :price, :discount, :description)
    end

    def line_item_params
      params
    end

    def validate_admin
      unless current_user.admin?
        redirect_to carts_path, notice: "access denied only admin can see"
      end
    end
end
