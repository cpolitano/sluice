require_relative '../spec_helper'
require_relative '../../app/models/tweet'

describe Tweet do 
let(:tweet) { Tweet.new(screen_name: "clarepolitan", name: "Clare", text: "some text", created_at: "date", tweetid: "345567888") }

	it { should belong_to(:query) }
	it { should validate_presence_of(:screen_name) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:text) }
	it { should validate_presence_of(:created_at) }
	it { should validate_presence_of(:tweetid) }
	
end