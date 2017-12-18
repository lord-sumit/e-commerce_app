class ProductsController < ApplicationController
    before_action :validate_admin, except: [:show, :index]
    # before_action :load_product, only: [:add_to_cart, ]
  def add_to_cart
    @cart = current_user.carts.find_or_create_by(completed: false)
    @line_item = @cart.line_items.find_or_create_by(product_id: params[:product_id])
    @line_item.update quantity: @line_item.quantity + 1
  end

  def remove_from_cart
    @line_item = current_user.carts.find_by(completed: 'false').
      line_items.find_by(product_id: params[:product_id])
    if @line_item.quantity > 1
      @line_item.update quantity: @line_item.quantity - 1
    else
      Cart.find_by_id(@line_item.cart_id)
      @line_item.destroy
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end

  def update
    @product = Product.find_by(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product)
        .permit(:name, :color, :price, :discount, :description)
    end

    def validate_admin
      unless current_user.admin?
        redirect_to products_path, notice: "access denied only admin can see"
      end
    end

end
