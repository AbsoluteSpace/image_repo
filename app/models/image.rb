class Image < ApplicationRecord
    validates :title, presence: true, format: {with: /\A[\w\-\s]+\z/, message: "Only alphanumeric characters, spaces, hyphens, and dashes allowed."}
    validates :body, presence: true
    validates :price, presence: true
    validates :discount, inclusion: { in: [ true, false ], message: "Only boolean values allowed." }
    validates :file_location, presence: true
end
