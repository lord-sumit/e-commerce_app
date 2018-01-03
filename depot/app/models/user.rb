class User < ApplicationRecord
  #Validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: { message: "must be given please" }
  validates :password, presence: true, length: { minimum: 4 }, uniqueness: true

  #Associations
  has_many :carts, inverse_of: :user
  has_many :line_items, through: :carts
  has_many :addresses
end
