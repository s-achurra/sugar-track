class Post < ApplicationRecord
  validates_presence_of :level
  belongs_to :user

  scope :posts_by, -> (user) { where(user_id: user.id) }

end
