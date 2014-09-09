class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.string :name
      t.string :text
      t.string :link_url
      t.string :created_at
      t.string :location
      t.string :tweetid
      t.references :user, index: true
      t.references :query, index: true
    end
  end
end
