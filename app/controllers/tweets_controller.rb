class TweetsController < ApplicationController

	#display all tweets saved by user
	def index
		@query = Query.find(params[:query_id])
		@tweets = Tweet.where(query_id: @query.id)
	end

	def new
		@tweet = Tweet.new
	end

	#save a tweet that resulted from a search query
	def create
		@tweet = Tweet.new(tweet_params)
		@query = Query.find(params[:query_id])
    @tweet.user_id = current_user.id
    @tweet.query_id = @query.id
  	if @tweet.save
  	 	redirect_to query_tweets_path(@query.id)
  	else
  	  render 'index'
  	end
	end

	#delete the saved tweet from database
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to query_tweets_path
	end

  private

	def tweet_params
	  params.permit(:screen_name, :name, :text, :link_url, :created_at, :location, :tweetid)
	end

end