class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
