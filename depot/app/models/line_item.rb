class LineItem < ApplicationRecord
  #Validatoins
  validates :cart, presence: true
  validates :product, presence: true

  #Associations
  belongs_to :cart
  belongs_to :product
end
