module FormHelper
  def setup_order(order)
    order.address ||= Address.new
    order
  end
end
