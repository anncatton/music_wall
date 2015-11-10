class User < ActiveRecord::Base

  has_many :songs

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

end

