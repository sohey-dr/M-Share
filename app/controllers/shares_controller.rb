class SharesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @share = current_user.shares.build(share_params)
    if @share.save
      flash[:success] = 'シェアを投稿しました。'
      redirect_to root_url
    else
      @shares = current_user.shares.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'シェアの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @share.destroy
    flash[:success] = 'シェアを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def show
    @share = Share.find(params[:id])
    @comments = @share.comments
    @comment = Comment.new
  end
  
  def new
    @share = Share.new
  end
  
  def share_params
    params.require(:share).permit(:music_name, :artist_name, :img)
  end
  
  def correct_user
    @share = current_user.shares.find_by(id: params[:id])
    unless @share
      redirect_to root_url
    end
  end
  
end
