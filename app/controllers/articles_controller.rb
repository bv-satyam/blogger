class ArticlesController < ApplicationController
	# http_basic_authenticate_with name: "name", password: "password", except: [:index, :show]

	def index
		@user = User.find(params[:user_id])
    @articles = @user.articles.all
  end

  def all
  	@articles = Article.all
	end

	def new
		@user = User.find(params[:user_id])
		@article = Article.new
  end

  def edit
  	@user = User.find(params[:user_id])
	  @article = @user.articles.find(params[:id])
	end

  def create
  	@user = User.find(params[:user_id])
  	@article = @user.articles.create(article_params)
	  if @article.save
	    render 'show'
	  else
	    render 'new'
	  end
  end

  def update
  	@user = User.find(params[:user_id])
	  @article = @user.articles.find(params[:id])
	  if @article.update(article_params)
	    render 'show'
	  else
	    render 'edit'
	  end
	end

	def destroy
		@user = User.find(params[:user_id])
	  @article = @user.articles.find(params[:id])
	  @article.destroy
	  redirect_to user_articles_path
	end

	def show
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
		# @article = Article.find(params[:id])
	end
  
  private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end

end
