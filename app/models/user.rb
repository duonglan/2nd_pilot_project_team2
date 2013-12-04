class User < ActiveRecord::Base
  has_many :groups,  foreign_key: "owner_id",  dependent: :destroy
  has_many :joined_groups, class_name:"GroupMember",  dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :comments, through: :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 1 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    microposts
  end
  
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
