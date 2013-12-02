class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :username
      t.string :full_name
      t.string :profile_picture
      t.string :token

      t.timestamps
    end
  end
end
