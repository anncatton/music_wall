class Song < ActiveRecord::Base

  validates :author, :title, presence: true

end