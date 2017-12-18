class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  has_many :carts
  has_many :line_items, through: :carts
  #scope :
end
