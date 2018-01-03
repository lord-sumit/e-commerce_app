class OrdersController < ApplicationController

  def checkout

  end

  def add_address
    debugger
  end

  def show

  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    debugger
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.addresses.each { |ad| ad.user = @current_user }
    order.save
    @current_user.carts.first.update order_id: order.id
    render 'show'
  end

  private
    def order_params
      params.require(:order).
        permit(:payment_type, addresses_attributes: [:id, :name, :mobile_no, :house_no,
                                                   :street, :landmark, :city,
                                                   :state, :_delete ])
    end

end
