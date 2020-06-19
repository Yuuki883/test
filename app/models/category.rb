class Category < ApplicationRecord
  has_many :topic_categories, dependent: :destroy
  has_many :topics, through: :topic_categories
  validates :name, presence: true, length: {maximum: 50, minimum: 1}

end
