class AddOrderRefToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :order, foreign_key: true
  end
end
