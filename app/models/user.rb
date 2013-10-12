class User < ActiveRecord::Base
  attr_accessible :user_name, :password_digest, :session_token

  has_many :cats

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_name, password)
    @user = User.find_by_user_name(user_name)

    if !@user.nil? && @user.is_password?(password)
      @user
    else
      @user = nil
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end



end
