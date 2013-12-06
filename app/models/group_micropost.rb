class GroupMicropost < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :group
  belongs_to :user
  has_many :group_comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :group_id, presence: true

  def has_comment?
    self.group_comments.count != EXISTANCE
  end
end
