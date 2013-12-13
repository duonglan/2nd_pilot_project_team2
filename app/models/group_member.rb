class GroupMember < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  default_scope -> {order("created_at DESC")}
  validates :user_id, presence: true
  validates :group_id, presence: true
end
