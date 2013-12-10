class Comment < ActiveRecord::Base
  EXISTANCE = 0
	belongs_to :micropost
  belongs_to :user
  has_many :like_comments, dependent: :destroy
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true
  validates :micropost_id, presence: true

<<<<<<< HEAD
=======
  include PublicActivity::Common
  
>>>>>>> 9650d485c6259f6d6a52961f06f67b8ff0797118
  def like_comment?(other_user)
    like_comments.find_by(user_id: other_user.id)
  end

  def has_like?
    self.like_comments.count > EXISTANCE
  end
end
