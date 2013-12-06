class GroupComment < ActiveRecord::Base
  EXISTANCE = 0
  belongs_to :group_micropost
  belongs_to :user
  belongs_to :group
  default_scope -> {order('created_at DESC')}
  validates :content, presence: true
  validates :group_micropost_id, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true

end
