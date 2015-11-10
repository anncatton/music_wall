class RemoveUpvotesFromSongs < ActiveRecord::Migration

  def change
    remove_column :songs, :upvotes, :integer, default: 0
  end
  
end
