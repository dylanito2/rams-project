class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :replies
  validates :title, presence: true, length: { maximum: 50 }

  def is_owned_by?(current_user)
    self.user == current_user
  end
end
