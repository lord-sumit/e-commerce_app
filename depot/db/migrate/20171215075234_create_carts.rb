class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.boolean :completed
      t.references :user, foreign_key: true
    end
  end
end
