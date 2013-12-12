class Image < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :album
  belongs_to :user
  has_many :like_images, dependent: :destroy
  has_many :image_comments, dependent: :destroy
  has_many :like_image_comments, through: :image_comments, dependent: :destroy
  has_attached_file :image, :styles => {
      :thumb => "100x100#",
      :small => "150x150>",
      :large => "900x960>"
    }
  default_scope -> {order("created_at DESC")}

  scope :all_image_user, ->user_id{where user_id: user_id}    

  validates :image, presence: true
  validates :user_id, presence: true
  validates :album_id, presence: true

  def has_comment?
    self.image_comments.count > EXISTANCE
  end

  def like_image?(other_user)
    like_images.find_by(user_id: other_user.id)
  end

  def has_like?
    self.like_images.count > EXISTANCE
  end
end