class Image < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :album
  has_many :image_comments, dependent: :destroy
  has_attached_file :image, :styles => {
      :thumb => "100x100#",
      :small => "150x150>",
      :large => "900x960>"}

  scope :all_image_user, ->user_id{where user_id: user_id}    

  validates :image, presence: true
  validates :user_id, presence: true
  validates :album_id, presence: true

  def has_comment?
    self.image_comments.count != EXISTANCE
  end
end