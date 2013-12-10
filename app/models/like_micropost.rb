class LikeMicropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  validates :micropost_id, presence: true
  validates :user_id, presence: true
end