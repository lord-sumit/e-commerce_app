class ProductsController < ApplicationController
  before_action :validate_admin, except: [:show, :index]

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

    def validate_admin
      unless current_user.admin?
        redirect_to products_path, notice: "access denied only admin can see"
      end
    end

end
