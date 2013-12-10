class LikeImageComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image_comment
  validates :image_comment_id, presence: true
  validates :user_id, presence: true
end
