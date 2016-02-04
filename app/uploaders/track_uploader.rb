# encoding: utf-8
class TrackUploader < CarrierWave::Uploader::Base
  def default_url(*_args)
    'https://s3-eu-west-1.amazonaws.com/bdi-music/uploads/article/default.png'
    end
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mp3)
  end
end
