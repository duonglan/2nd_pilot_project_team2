class GroupComment < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :group_micropost
  belongs_to :user
  belongs_to :group
  has_many :like_group_comments, dependent: :destroy
  default_scope -> {order('created_at DESC')}
  validates :content, presence: true
  validates :group_micropost_id, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true

  def has_like?
    self.like_group_comments.count > EXISTANCE
  end

  def like_group_comment?(other_user)
    like_group_comments.find_by(user_id: other_user.id)
  end
end
