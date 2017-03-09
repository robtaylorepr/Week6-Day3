class Post < ApplicationRecord

  belongs_to  :user
  attr_accessor :id, :body, :title, :created_at


end
