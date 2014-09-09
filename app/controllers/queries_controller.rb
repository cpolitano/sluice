require 'uri'

class QueriesController < ApplicationController

	before_action :authenticate_user!, :except =>[:index]

	def index
    #@queries = Query.all
    @queries = Query.where(user: current_user)
	end

	def show
		@query = Query.find(params[:id])
    consumer_key = OAuth::Consumer.new(
        "HhYqosWKAzPxuFeA6lGw5EwQz",
        "m107u9qoYw96IAGLhyP2KSgKUUKnhsIJsrUL49dZGm730FKIYv")
    access_token = OAuth::Token.new(
        "23667182-htHTmPzw8QS3wUHYuz0wP18pnao8t0jVEOzzzU8xn",
        "pPFdTbqIN64lUPJSHJ4IJIGa7epOyLPZ6Ony7WNvy2a1i")
    baseurl = "https://api.twitter.com"
    path = "/1.1/search/tweets.json"
    #query = URI.encode_www_form("query" => "#{@query.keyword}")
    #"id" => "TWEET ID GOES HERE"
    #keyword = url_encode(query_keyword)
    address = URI("#{baseurl}#{path}?q=#{@query.keyword}")
    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request = Net::HTTP::Get.new address.request_uri
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request
    @tweets = JSON.parse(response.body)
    @tweet = Tweet.new
	end

	def new
		  @query = Query.new
	end

  def create
  		@query = Query.new(query_params)
      @query.user_id = current_user.id
  	if @query.save
  	 	redirect_to @query
  	else 
  	  render 'new'
  	end
  end

  def edit
  	@query = Query.find(params[:id])
  end

  def update
  	@query = Query.find(params[:id])
  	if @query.update(query_params)
  	redirect_to @query
    else
      render 'edit'
  	end
  end

  def destroy
  	@query = Query.find(params[:id])
  	@query.destroy
  	redirect_to queries_path
  end

  private

  def query_params
  	params.require(:query).permit(:keyword)
  end

end