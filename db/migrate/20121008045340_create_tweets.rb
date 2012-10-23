class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :message
      t.datetime :created_at
    end
  end
  def self_down
    drop_table :tweets
  end
end
