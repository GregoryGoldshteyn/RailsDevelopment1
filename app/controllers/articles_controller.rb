class ArticlesController < ApplicationController

	def index #this will be found at articles itself
		#grab all articles
		@articles = Article.all
	end

	#these will be found at articles/NAME
	#IE articles/new

	def new
		@article = Article.new #goes to the article new webpage
	end

	def edit
		@article = Article.find(params[:id])#finds the article by the id which is passed
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def create
		#render plain: params[:article].inspect #simple code to show what is recieved by the create action
		@article = Article.new(article_params)
		if @article.save #saves the artivle to the database
			flash[:notice] = "Article was successfully created" #displays success message
			redirect_to article_path(@article) #calls the show action using the article as a parameter
		else
			flash[:notice] = "Article could not be created"
			render 'new' #go back to new article page
		end
	end

	def show

		@article = Article.find(params[:id]) #finds the article based on the ID from the previous page

	end

	private
		def article_params #Private method used to whitelist paramerters used by the system
			params.require(:article).permit(:title, :description) #permits the title and desc
		end

end
