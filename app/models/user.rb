class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def post_data
    posts = self.posts
    data = Hash.new

    posts.each { |post| data[post.created_at.to_date] = post.level}

    data
  end
end
