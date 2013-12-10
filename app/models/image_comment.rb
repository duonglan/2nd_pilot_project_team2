class ImageComment < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :image
  belongs_to :user
  has_many :like_image_comments, dependent: :destroy
  default_scope -> {order('created_at DESC')}
  validates :content, presence: true
  validates :user_id, presence: true
  validates :image_id, presence: true
  validates :album_id, presence: true

  def like_image_comment? other_user
    like_image_comments.find_by user_id: other_user.id
  end

  def has_like?
    self.like_image_comments.count > EXISTANCE
  end
end