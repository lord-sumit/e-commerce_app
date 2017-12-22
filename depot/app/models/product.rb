class Product < ApplicationRecord
  has_attached_file :image, styles: { small: "64x64" }
  #Validatoins
  validates :name, presence: true
  validates :description, length: { maximum: 5 }, allow_blank: true

  #Associations
  has_many :line_items, inverse_of: :product
end
