class AddDeactivateInstagramToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deactivate_instagram, :datetime
  end
end
