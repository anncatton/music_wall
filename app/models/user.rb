class User < ActiveRecord::Base

  has_many :songs

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  validate :ensure_correct_password
  validate :ensure_email_exists

  def ensure_correct_password

  end

  def ensure_email_exists

  end

end