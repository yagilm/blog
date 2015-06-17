class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
#   ^ instance variable (@ prefixed) to hold reference to the article object
# "We do this because Rails will pass all instance variables to the view."
  end

  def new
    @article = Article.new
  end

  def create
    # Removing the next line as the article_params method is made so it can be reused by multiple actions
    #@article = Article.new(params.require(:article).permit(:title, :text))

    # To display the fields in the web browser
    # render plain: params[:article].inspect

    # Initializing the Article model with the respective atributes //  params containes the attributes
#    @article = Article.new(params[:article])
#              ^ class names _must_ beggin with capital letter
# => use the method article_params for getting in the parameters
    @article = Article.new(article_params)
    # Saving the model in the database ->
    if @article.save
      # Redirecting user to the show action
      redirect_to @article
    else
      render 'new'
    end
  end

# both allow(permit) and require(require) the title and text parameters for valid use of create.
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
