class Song < ActiveRecord::Base

  belongs_to :user
  has_many :up_votes
  
  validates :author, :title, presence: true

end