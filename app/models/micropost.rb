class Micropost < ActiveRecord::Base
    include PublicActivity::Common

  EXISTANCE = 0
	belongs_to :user
	has_many :comments, dependent: :destroy
  has_many :like_microposts, dependent: :destroy
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 300}
  validates :user_id, presence: true

  def is_public?
    self.status == true
  end

  def has_comment?
    self.comments.count > EXISTANCE
  end

  def like_micropost?(other_user)
    like_microposts.find_by(user_id: other_user.id)
  end

  def has_like?
    self.like_microposts.count > EXISTANCE
  end
end
