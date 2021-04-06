class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    find_artists
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    #find_artists
    @artist = Artist.find_by(params[:id])
  end

  def update
    find_artists.update(artist_params)
    redirect_to artist_path(@artist)
  end



  private
    def artist_params
      params.require(:artist).permit(:name, :bio)
    end

    def find_artists
      @artist = Artist.find_by(params[:id])
    end
end
