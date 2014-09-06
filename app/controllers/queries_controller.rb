class QueriesController < ApplicationController

	def index
		@queries = Query.all
	end

	def show
		@query = Query.find(params[:id])
	end

	def new
		@query = Query.new
	end

  	def create
  		@query = Query.new(query_params)
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