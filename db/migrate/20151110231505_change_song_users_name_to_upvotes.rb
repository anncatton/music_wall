class ChangeSongUsersNameToUpvotes < ActiveRecord::Migration

  def change
    rename_table :songs_users, :up_votes  
  end

end
