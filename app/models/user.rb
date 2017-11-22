class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def posts_data(data=nil)
    end_date = data ? data[:end_date].to_date : Date.today+1.day
    start_date = data ? data[:start_date].to_date : end_date-31.days
    posts = self.posts.where(created_at: start_date..end_date)
    data = Hash.new

    posts.each { |post| data[post.created_at.to_date] = post.level }

    data
  end

  def posts_search(data=nil)
    end_date = data ? data[:end_date].to_date : Date.today + 1.day
    start_date = data ? data[:start_date].to_date : end_date-31.days
    self.posts.where(created_at: start_date..end_date)
              .select(:id, :created_at, :level)
  end
end
