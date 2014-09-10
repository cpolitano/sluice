require_relative '../spec_helper'
require_relative '../../app/models/query'

describe Query do 
let(:query) { Query.new(keyword: "earthquake") }

	it { should have_many(:tweets) }
	it { should belong_to(:user) }
	it { should validate_presence_of(:keyword) }
	it { should validate_presence_of(:user_id) }
	
	describe "#search_twitter" do

    	it "should return tweets containing the keyword" do
      		@tweets = query.search_twitter(query.keyword)
      		expect(@tweets).to be_truthy
    	end

	end

end