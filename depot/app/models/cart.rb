class Cart < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  has_many :line_items, inverse_of: :cart
  has_many :products, through: :line_items
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
