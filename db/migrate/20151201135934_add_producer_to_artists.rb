class AddProducerToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :producer, :boolean
  end
end
