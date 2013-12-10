class ImageComment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user
  default_scope -> {order("created_at DESC")}
  validates :content, presence: true
  validates :user_id, presence: true
  validates :image_id, presence: true
  validates :album_id, presence: true
end