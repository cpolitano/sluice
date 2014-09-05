class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.string :name
      t.string :text
      t.string :link_url
      t.string :created_at
      t.string :location
      t.integer :tweet_id
      t.references :user, index: true
      t.references :query, index: true

      t.timestamps
    end
  end
end
