class ChangeCompletedColumnDefaultToCarts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :carts, :completed, from: '', to: false
  end
end
