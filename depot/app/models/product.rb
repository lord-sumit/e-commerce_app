class Product < ApplicationRecord
  has_many :line_items, inverse_of: :product
  validates :name, presence: true
  validates :description, length: { maximum: 5 }, allow_blank: true
end
