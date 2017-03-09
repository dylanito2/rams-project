class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :account
  has_many :replies
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  delegate :username, to: :account
  delegate :about_me, to: :account
  delegate :is_admin, to: :account
  delegate :is_moderator, to: :account
end
