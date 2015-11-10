class User < ActiveRecord::Base

  # has_many :songs
  has_secure_password
  has_many :songs, :through => :songs_users

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

end

