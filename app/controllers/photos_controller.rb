class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: {message: "success", photoId: @photo.id}, status: 200
      # ↑ここのメッセージが画像アップ時にはデベロッパーツールでは表示されるので、@photoには中身を格納できている
      # @photo.saveしたあとどうなるのか？
    else
      render json: {error: @photo.errors.full_messages.join(", ")}, status: 400
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      render json: {message: "file deleted drom server"}
    else
      render json: {message: @photo.errors.full_messages.join(", ")}
    end
  end

  def list
    listing = Listing.find(params[:listing_id])

    photos = []
    Photo.where(listing_id: listing.id).each do |photo|
      new_photo = {
        id: photo.id,
        name: photo.image_file_name,
        size: photo.image_file_size,
        src: photo.image(:thumb)
      }
      photos.push(new_photo)
    end
    render json: {images: photos }
  end

  private
  def photo_params
    params.require(:photo).permit(:image,:lising_id)
  end

end
