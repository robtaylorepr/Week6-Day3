class User < ApplicationRecord
  has_many  :posts
  attr_accessor :name

end
