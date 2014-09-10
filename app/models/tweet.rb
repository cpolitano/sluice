class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :query

  validates :screen_name, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :created_at, presence: true
  validates :tweetid, presence: true

end
