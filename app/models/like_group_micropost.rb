class LikeGroupMicropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_micropost
  validates :group_micropost_id, presence: true
  validates :user_id, presence: true
end