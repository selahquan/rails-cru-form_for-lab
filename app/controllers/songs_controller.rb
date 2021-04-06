class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    find_song
  end

  def update
    find_song
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(params[:id])
  end

  private
    def find_song
      @song = Song.find_by(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
