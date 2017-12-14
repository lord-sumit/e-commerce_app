class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find_by(params[:id])
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
    @product = Product.find_by(params[:id])
    @product.destroy
    redirect_to @products
  end

  private
    def product_params
      params.require(:product)
        .permit(:name, :color, :price, :discount, :description)
    end

end
