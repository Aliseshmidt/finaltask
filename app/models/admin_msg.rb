class AdminMsg < ApplicationRecord
    validates :body, presence: true

    validates :body, length: { minimum: 5 }

    validates :body, uniqueness: true
end
