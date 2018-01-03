class AddTotalToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :total, :float, default: 0
  end
end
