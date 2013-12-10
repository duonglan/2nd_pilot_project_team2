class LikeImage < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  validates :image_id, presence: true
  validates :user_id, presence: true
end
