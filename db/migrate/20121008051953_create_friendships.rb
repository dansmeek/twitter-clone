class CreateFriendships < ActiveRecord::Migration
  def change

    create_table :friendships do |t|
      t.string :user_id
      t.string :integer
      t.string :friend_id
      t.string :integer

      t.timestamps
    end
  end
  def self_down
    drop_table :friendships
  end

end
