class AddUserIdToRailsTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :rails_tutorials, :user_id, :integer
    add_index :rails_tutorials, :user_id
  end
end
