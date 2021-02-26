class ChangeArtworksTable < ActiveRecord::Migration[5.2]
  def change
      remove_index :artworks, :artist_id
      remove_index :artworks, :title
      add_index :artworks, [:title, :artist_id], unique: true
  end
end
