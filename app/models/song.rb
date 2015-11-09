class Song < ActiveRecord::Base

  belongs_to :user
  
  validates :author, :title, presence: true

end