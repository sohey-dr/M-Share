class FavoritesController < ApplicationController

  def create
    @share = Share.find(params[:share_id])
    favorite = current_user.favorites.build(share_id: params[:share_id])
    favorite.save
  end

  def destroy
    @share = Share.find(params[:share_id])
    favorite = Favorite.find_by(share_id: params[:share_id], user_id: current_user.id)
    favorite.destroy
  end
end
