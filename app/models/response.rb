class Response < ApplicationRecord
  belongs_to :topic
  validates :name, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
