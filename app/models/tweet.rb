class Tweet < ActiveRecord::Base
  attr_accessible :created_at, :message, :user_id
  belongs_to :user
  validates_presence_of :user_id, :message, :created_at

end
