class UsersController < ApplicationController
  def show #show.html.erbを表示するアクション
    @user = User.find(params[:id]) #Userモデルから、userを探してきた
    @kanji = "漢字"
  end
end
