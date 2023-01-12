class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :builds, dependent: :destroy
    has_one_attached :image
    validates :image, presence: true
    validates :title, presence: true,
                      length: {minimum:5}
end
