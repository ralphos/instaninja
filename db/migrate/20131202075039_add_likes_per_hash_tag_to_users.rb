class AddLikesPerHashTagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes_per_hashtag, :integer
  end
end
