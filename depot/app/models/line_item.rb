class LineItem < ApplicationRecord
  #Validatoins
  validates :cart, presence: true
  validates :product, presence: true

  #Associations
  belongs_to :cart
  belongs_to :product

  def calculate_total_price
    ( price - discount ) * quantity
  end

end

