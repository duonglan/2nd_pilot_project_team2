class LikeComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validates :comment_id, presence: true
  validates :user_id, presence: true
end
