class Band < ApplicationRecord
  validates :name, presence: true

  has_many :albums,
  foreign_key: :band_id,
  class_name: :Album

  has_many :tracks,
  through: :albums,
  source: :track

end
