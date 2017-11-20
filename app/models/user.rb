class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def posts_data(start_date=Date.today-30.days, end_date=Date.today+1.day)
    posts = self.posts.where(created_at: start_date..end_date)
    data = Hash.new

    posts.each { |post| data[post.created_at.to_date] = post.level}

    data
  end

  def posts_search(start_date=Date.today-30.days, end_date=Date.today+1.day)
    self.posts.where(created_at: start_date..end_date)
              .select(:id, :created_at, :level)
  end
end
