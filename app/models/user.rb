class User < ApplicationRecord
  has_many  :posts
  validates   :name, presence:   true,
                     uniqueness: true
  validates   :avatar, presence: true
  validates   :email, presence:  true
  has_secure_password
  acts_as_follower
  acts_as_followable

  # default_scope { where(active: true) }

  # User.active
  # scope :active, -> { where(active: true) }


  # def avatar
  #   attributes["avatar"].blank? ? "https://robohash.org/#{username}.png" : attributes["avatar"]
  # end

  def to_s
    username
  end

end
