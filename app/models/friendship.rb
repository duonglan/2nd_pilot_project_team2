class Friendship < ActiveRecord::Base
	belongs_to :user
  belongs_to :friend, class_name: User.name, foreign_key: "friend_id"
end