class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :"songs/index"
  end

  get 'songs/:slug' do
    @song = Song.all.find(params[:name].slug)
  end

end
