class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    validates :password_digest, presence: true
    validates :session_token, presence: true

    after_initialize :ensure_session_token

    attr_reader :password

    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal

    has_many :own_comments,
    foreign_key: :user_id,
    class_name: :Comment

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.password?(password)
            return user
        else
            return nil
        end
        # user = User.new(:username, :password)
        #check if users sesion token is eq to session token user
    end

    def password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

     def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64 # creates a random string
    end



end
