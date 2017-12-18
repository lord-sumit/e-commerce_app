class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.integer :discount
      t.text :description
    end
  end
end
