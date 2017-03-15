class Post < ApplicationRecord

  belongs_to  :user
  validates   :title, presence: true
  validates   :body,  presence: true
  delegate :avatar, to: :user
  default_scope { order(created_at: :desc) }

  # def avatar
  #   user.avatar
  # end

  def is_owner?(this_user)
    user == this_user
  end


end
