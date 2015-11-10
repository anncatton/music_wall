class AddUpvoteToSongs < ActiveRecord::Migration

  def change
    add_column :songs, :upvotes, :integer, default: 0
  end

end
