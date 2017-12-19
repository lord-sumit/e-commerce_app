class User < ApplicationRecord
  #Validatoins
  validates :email, length: { is: 6 }, uniqueness: true
  validates :username, presence: { message: "must be given please" }
  validates :username, length: { minimum: 2 }

  #Associations
  has_many :carts, inverse_of: :user
  has_many :line_items, through: :carts
end
