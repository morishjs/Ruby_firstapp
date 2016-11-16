#일반적으로 WelcomeController이면
#Views 폴더에 서브 폴더로 welcome이라는 폴더를 만드는것이 통상적이다.

class WelcomeController < ApplicationController

  def home
    redirect_to articles_path if logged_in?
  end

  def about

  end

end