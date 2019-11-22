class ArtworksController < ApplicationController
  def index
    artworks = Artwork.all
    render json: artworks
  end

  def create
    debugger
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: 'Artowrrk not found', status: 422
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    # if artwork
    if artwork
      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    else
      render json: 'Artowrrk not found', status: 422
    end


  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      render json: artwork
    else
      render json: 'Artowrrk not found', status: 422
    end
  end

  private 
  def artwork_params
    params.require(:artwork).permit(:image_url, :title, :artist_id)
  end
end