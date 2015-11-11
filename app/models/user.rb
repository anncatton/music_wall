class User < ActiveRecord::Base

  has_many :songs
  has_many :up_votes
  has_secure_password
  # has_many :songs, :through => :songs_users

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

end

