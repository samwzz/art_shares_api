class ArtworksController < ApplicationController

  def index
    created_artworks = Artwork.find_by(artist_id: params[:user_id])

    viewer = User.find_by(id: params[:user_id])
    viewed_artworks = viewer.shared_artworks

    # all_artworks = created_artworks + viewed_artworks
    #return all artworks where artworks.artist_id matches user_id
    #return all artworks where artwork_shares.viewer_id matches user_id
    render json: { created: created_artworks, viewed: viewed_artworks}
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def show
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      render json: artwork
    else
      render json: ['No artwork found.'], status: 420
    end

  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])

    artwork.destroy!

    render json: artwork
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.update(artwork_params)
      render json: artwork
    else
      render(
        json: ['No artwork found.'], status: 420
      )
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
