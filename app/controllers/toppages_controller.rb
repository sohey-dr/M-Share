class ToppagesController < ApplicationController
  def index
    if logged_in?
      @shares = current_user.shares.order(id: :desc).page(params[:page])
    end
  end
end
