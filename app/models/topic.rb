class Topic < ApplicationRecord
  has_many :posts
  has_many :replies, through: :posts
  validates :name, presence: true, length: { in: (3..30)}, uniqueness: true
end
