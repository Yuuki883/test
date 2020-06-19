class Topic < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_many :topic_categories, dependent: :destroy
  has_many :categories, through: :topic_categories
  validates :title, presence: true, length: {maximum: 50, minimum: 1}
end
