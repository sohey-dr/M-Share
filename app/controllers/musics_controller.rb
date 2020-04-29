class MusicsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
  
  def index
    if params[:search].present?
    @searchartists = RSpotify::Track.search(params[:search])
    end
  end
  
  def search
    if params[:search].present?
    @searchartists = RSpotify::Artist.search(params[:search])
    end
  end
end
