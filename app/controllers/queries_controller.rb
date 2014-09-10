class QueriesController < ApplicationController

	before_action :authenticate_user!, :except =>[:index]

	def index
    @queries = Query.where(user: current_user)
	end

	def show
		@query = Query.find(params[:id])
    @tweets = @query.search_twitter(@query.keyword)
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