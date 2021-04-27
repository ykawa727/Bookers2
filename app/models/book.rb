class Book < ApplicationRecord

  belongs_to :user
  #attachment :profile_image.user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
end
