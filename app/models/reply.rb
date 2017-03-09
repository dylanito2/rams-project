class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def is_owned_by?(current_user)
    self.user == current_user
  end 
end
