class AddRatingAndFactorToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :rating, :float
    add_column :products, :rating_factor, :integer
  end
end
