class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image
end
