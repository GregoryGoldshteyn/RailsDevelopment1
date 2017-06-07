class ArticlesController < ApplicationController

	#Causes these actions to call this method before running
	before_action :set_article, only: [:edit, :update, :destroy, :show] 

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
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def create
		#render plain: params[:article].inspect #simple code to show what is recieved by the create action
		@article = Article.new(article_params)
		if @article.save #saves the artivle to the database
			flash[:success] = "Article was successfully created" #displays success message
			redirect_to article_path(@article) #calls the show action using the article as a parameter
		else
			flash[:notice] = "Article could not be created"
			render 'new' #go back to new article page
		end
	end

	def show


	end

	def destroy
		@article.destroy
		flash[:success] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private
		def article_params #Private method used to whitelist paramerters used by the system
			params.require(:article).permit(:title, :description) #permits the title and desc
		end
		def set_article
			@article = Article.find(params[:id])
		end

end
