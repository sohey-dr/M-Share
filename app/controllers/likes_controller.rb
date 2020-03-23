class LikesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @user = current_user
    @like = current_user.likes.build(like_params)
    if @like.save
      flash[:success] = '好きなアーティストを設定しました'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'likes/new'
    end
  end

  def destroy
    @like.destroy
    flash[:success] = '好きなアーティストを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def new
    @like = Like.new
  end

  private

  def like_params
    params.require(:like).permit(:like_artist, :img)
  end
  
  def correct_user
    @like = current_user.likes.find_by(id: params[:id])
    unless @like
      redirect_to root_url
    end
  end
end
