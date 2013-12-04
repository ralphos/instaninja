class CreateUserCommenters < ActiveRecord::Migration
  def change
    create_table :user_commenters do |t|
      t.string :username
      t.string :uid
      t.integer :user_id
      t.string :profile_picture

      t.timestamps
    end
  end
end
