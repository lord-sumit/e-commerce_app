class User < ApplicationRecord
  validates :email, length: { is: 6 }, uniqueness: true
  validates :username, presence: { message: "must be given please" }
  validates :username, length: { minimum: 2 }
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  has_many :carts, inverse_of: :user
  has_many :line_items, through: :carts
  #validates_associated :carts, :line_items
end
