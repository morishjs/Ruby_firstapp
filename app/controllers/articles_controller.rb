class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully saved"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      #article 클래스의 (article.rb)
      #"article"=>{"title"=>"aa", "description"=>"aasdf"} 이런 식으로 파라미터가 넘어옴
      params.require(:article).permit(:title, :description)
    end
end