class ToppagesController < ApplicationController
  def index
    
    if logged_in?
      if params[:artist_name].present?
        @share = Share.where('artist_name LIKE ?', "%#{params[:artist_name]}%")
        @shares = @share.order(id: :desc).page(params[:page])
      else
        @shares = current_user.feed_shares.order(id: :desc).page(params[:page])
      end
    end
    
    
  end
end
