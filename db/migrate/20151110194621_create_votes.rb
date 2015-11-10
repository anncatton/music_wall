class CreateVotes < ActiveRecord::Migration

  def change
    create_join_table :songs, :users
  end

end
