class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true

  attr_reader :password

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end 

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user.save && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user
    else
      return nil
    end
  end

  def reset_session_token!
    token = SecureRandom.base64
    self.session_token = token
    self.save!
    return self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.base64
  end

end
