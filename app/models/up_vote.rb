class UpVote < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

  upvotes = UpVote.where(user_id: current_user.id, song_id: song_id)

end