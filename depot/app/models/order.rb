class Order < ApplicationRecord
  has_one :cart
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
end
