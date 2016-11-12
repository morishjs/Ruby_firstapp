class ArticlesController < ApplicationController
  #어떻게 set_article이 먼저 호출되도록 할 수 있는가?(only에 있는 함수들이 호출될 때 시점에서)
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end


  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was successfully saved"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render :new
    end

  end

  def destroy
    @article.destroy
    flash[:danger] = "Article is deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    end
    def article_params
      #article 클래스의 (article.rb)
      #"article"=>{"title"=>"aa", "description"=>"aasdf"} 이런 식으로 파라미터가 넘어옴
      params.require(:article).permit(:title, :description)
    end
