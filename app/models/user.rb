class User < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :groups,  foreign_key: "owner_id",  dependent: :destroy
  has_many :joined_groups, class_name:"GroupMember",  dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :comments, through: :microposts, dependent: :destroy
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend,
   :conditions => "status = 'requested'", :order => :created_at
  has_many :pending_friends, :through => :friendships,
   :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  has_many :friendships, :dependent => :destroy
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



def self.search(search)
  if search
    find(:all, :conditions => ["name LIKE '%?%'", search[:name]])
  else
    find(:all)
  end
end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
