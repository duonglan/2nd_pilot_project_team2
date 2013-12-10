class GroupMicropost < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :group
  belongs_to :user
  has_many :like_group_microposts, dependent: :destroy
  has_many :group_comments, dependent: :destroy
  default_scope -> {order("created_at DESC")}
  validates :user_id, presence: true
  validates :group_id, presence: true

  def has_comment?
    self.group_comments.count > EXISTANCE
  end

  def like_group_micropost? other_user
    like_group_microposts.find_by user_id: other_user.id
  end

  def has_like?
    self.like_group_microposts.count > EXISTANCE
  end
end