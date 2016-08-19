# encoding: utf-8
class ProductUploader < CarrierWave::Uploader::Base
  def default_url(*_args)
    'https://s3-eu-west-1.amazonaws.com/bdi-music/uploads/article/default.png'
    end
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  process crop: :image

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :testingplease do
    process :croptest
    process resize_to_fill: [1000, 700]
  end

  version :thumbnail do
    process resize_to_fit: [50, 50]
  end

  version :artistmain do
    process resize_and_crop: 200
  end

  version :photomain do
    process resize_and_crop_photo: 200
  end

  version :articlehome do
    process resize_and_crop_home: 1200
  end

  version :homecont do
    process resizehome: [1200, 800]
  end

  version :morenews do
    process :morenewstest
    process resize_to_fill: [260, 150]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  private

  def morenewstest
    manipulate! do |img|
      if img[:width] < img[:height]
        remove = ((img[:height] - img[:width]) / 2).round
        img.shave("0x#{remove}")
      elsif img[:width] > img[:height]
        remove = ((img[:width] - img[:height]) / 2).round
        img.shave("#{remove}x0")
      end
      img
    end
    end

  def croptest
    manipulate! do |img|
      if img[:width] < img[:height]
        remove = ((img[:height] - img[:width]) / 2).round
        img.shave("0x#{remove}")
      elsif img[:width] > img[:height]
        remove = ((img[:width] - img[:height]) / 2).round
        img.shave("#{remove}x0")
      end
      img
    end
    end

  def resizehome(width, height, gravity = 'Center')
    manipulate! do |img|
      img.combine_options do |cmd|
        cmd.resize width.to_s
        if img[:width] < img[:height]
          cmd.gravity gravity
          cmd.background 'rgba(255,255,255,0.0)'
          cmd.extent "#{width}x#{height}"
        end
      end
      img = yield(img) if block_given?
      img
    end
  end

  def resize_and_crop(size)
    manipulate! do |image|
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width]) / 2).round
        image.shave("0x#{remove}")
      elsif image[:width] > image[:height]
        remove = ((image[:width] - image[:height]) / 2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end

  def resize_and_crop_home(size)
    manipulate! do |image|
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width]) / 2).round
        image.shave("0x#{remove}")
      elsif image[:width] > image[:height]
        remove = ((image[:width] - image[:height]) / 2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
    end

  def resize_and_crop_test(_width, _height)
    manipulate! do |image|
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width]) / 2).round
        image.shave("0x#{remove}")
      elsif image[:width] > image[:height]
        remove = ((image[:width] - image[:height]) / 2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
    end

  def resize_and_crop_photo(size)
    manipulate! do |photo|
      if photo[:width] < photo[:height]
        remove = ((photo[:height] - photo[:width]) / 2).round
        photo.shave("0x#{remove}")
      elsif photo[:width] > photo[:height]
        remove = ((photo[:width] - photo[:height]) / 2).round
        photo.shave("#{remove}x0")
      end
      photo.resize("#{size}x#{size}")
      photo
    end
  end
end
