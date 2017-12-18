class ChangeQuantityColumnDefaultInLineItems < ActiveRecord::Migration[5.1]
  def change
    change_column_default :line_items, :quantity, from: nil, to: 0
  end
end
