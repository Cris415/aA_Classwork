class User < ApplicationRecord
  validates :email, uniqueness: true

  after_initialize :ensure_session_token
  attr_reader :password # to validate password length later

  # SPIRE self.find_by_credentials   is_password   password=() reset_session_token  ensure_session_token
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)

       user
    else
       nil
    end
  end

  def self.generate_session_token
     SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
