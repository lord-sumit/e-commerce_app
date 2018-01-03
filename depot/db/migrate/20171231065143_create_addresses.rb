class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :name
      t.integer :mobile_no
      t.text :house_no
      t.text :street
      t.text :landmark
      t.text :city
      t.text :state
      t.references :order, foreign_key: true
    end
  end
end
