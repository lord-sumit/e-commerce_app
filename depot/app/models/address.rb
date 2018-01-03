class Address < ApplicationRecord
  #Associations
  belongs_to :order
  belongs_to :user
end
