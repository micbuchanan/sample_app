class User < ActiveRecord::Base
  has_secure_password
 # Both lines below downcase the email. 2nd one is tidier
 # before_save { self.email = email.downcase }
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }
end

