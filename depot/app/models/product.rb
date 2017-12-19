class Product < ApplicationRecord
  #Validatoins
  validates :name, presence: true
  validates :description, length: { maximum: 5 }, allow_blank: true

  #Associations
  has_many :line_items, inverse_of: :product
end
