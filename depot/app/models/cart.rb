class Cart < ApplicationRecord
  #Validatoins
  validates :user, presence: true

  #Associations
  belongs_to :user
  has_many :line_items, inverse_of: :cart
  has_many :products, through: :line_items

  #Scopes
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
