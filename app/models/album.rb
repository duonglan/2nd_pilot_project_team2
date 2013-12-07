class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true
end