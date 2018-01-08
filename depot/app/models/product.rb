class Product < ApplicationRecord
  has_attached_file :image

  #Validatoins
  validates :name, presence: true
  validates :description, length: { maximum: 5 }, allow_blank: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Associations
  has_many :line_items, inverse_of: :product



  def update_rating(user_rating)
    self.rating = (( rating * rating_factor ) + user_rating.to_i ) / ( rating_factor + 1)
    update(rating: rating.round(2), rating_factor: rating_factor + 1 )
    rating
  end
end
