
class User < ActiveRecord::Base
  has_many :rounds
  

	attr_reader :entered_password

  validates :name, presence: true
  VALID_EMAIL_REGEX = /^[a-z0-9][a-z0-9_\.-]{0,}[a-z0-9]@[a-z0-9][a-z0-9_\.-]{0,}[a-z0-9][\.][a-z0-9]{2,4}$/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  # validates :entered_password, length: { minimum: 6 }
 
   include BCrypt

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
    	# @password_confirmation = (@entered_password == confirmation)
    	@entered_password = new_password
      @password = Password.create(new_password)
      self.password_hash = @password
    end

    def self.authenticate(email, password)
      user = User.find_by_email(email)
      user && (Password.new(user.password_hash) == password)
    end
end
