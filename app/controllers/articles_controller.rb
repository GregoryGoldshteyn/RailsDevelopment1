class ArticlesController < ApplicationController

	def new
		@article = Article.new #goes to the article new webpage
	end

	def create
		#render plain: params[:article].inspect #simple code to show what is recieved by the create action
		@article = Article.new(article_params)
		@article.save #saves the artivle to the database
		redirect_to articles_show(@article) #calls the show action using the article as a parameter
	end

	private
		def article_params #Private method used to whitelist paramerters used by the system
			params.require(:article).permit(:title, :description) #permits the title and desc
		end

end
