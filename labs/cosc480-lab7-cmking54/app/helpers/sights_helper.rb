module SightsHelper
  def random_image_if_available(sight)
    if sight.photos.count > 0
      return image_tag(sight.random_photo.image.url(:thumb), height: 80)
    else
      ""
    end
  end
end
