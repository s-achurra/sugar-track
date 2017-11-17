class Post < ApplicationRecord
  validates_presence_of :level
  belongs_to :user
end
