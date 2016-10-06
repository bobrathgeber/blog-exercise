class ArticlesController < ApplicationController
def index
  @articles = Article.all
end

  def show
      @article = Article.find(params[:id])
    end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #@article = Article.new(params[:article]) #params[:article] contains the attributes we want
    @article = Article.new(article_params) #this line restricts the param instead of the top line

    if @article.save                            #saves the model into the database -- returns boolean
      redirect_to @article                      #redirect the user to the show action
                                                #QUESTION: why does it redirect to the show action?
    else
      render 'new' #The render method is used so that the @article object is passed back to
                   #the new template when it is rendered. This rendering is done within the
                   #same request as the form submission, whereas the redirect_to will tell
                   #the browser to issue another request.
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
