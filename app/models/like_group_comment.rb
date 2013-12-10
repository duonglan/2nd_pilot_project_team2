class LikeGroupComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_comment
  validates :group_comment_id, presence: true
  validates :user_id, presence: true
end