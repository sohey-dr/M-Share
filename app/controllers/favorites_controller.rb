class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    share = Share.find(params[:share_id])
    current_user.favorite(share)
    flash[:success] = 'シェアをお気に入りしました。'
    redirect_to share_url(share)
  end

  def destroy
    share = Share.find(params[:share_id])
    current_user.unfavorite(share)
    flash[:success] = 'シェアのお気に入りを解除しました。'
    redirect_to share_url(share)
  end
end
