class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  has_many :subs,
    class_name: "Sub",
    foreign_key: :moderator_id

  has_many :posts,
    foreign_key: :author_id,
    dependent: :destroy

  has_many :comments,
    foreign_key: :author_id,
    dependent: :destroy

  after_initialize :ensure_session_token

  def self.find_by_credentials(username,password)
    user = User.find_by(username: username)
    return unless user
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!

    session_token
  end

  def is_moderator?(sub)
    self.id == sub.moderator_id
  end

  def is_author?(post)
    self.id == post.author_id
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
