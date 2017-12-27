class Admin < ApplicationRecord
  #Validatoins
  validates :email, length: { is: 6 }, uniqueness: true
  validates :user_name, presence: { message: "must be given please" }
  validates :user_name, length: { minimum: 2 }
  validates :password, presence: true
  #Associations
  has_many :carts, inverse_of: :user
  has_many :line_items, through: :carts
end
