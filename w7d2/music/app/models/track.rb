class Track < ApplicationRecord
  validates :album_id, :title, :ord, :track_type, presence: true

  belongs_to :album, dependent: :destroy,
  foreign_key: :album_id,
  class_name: :Album

end
