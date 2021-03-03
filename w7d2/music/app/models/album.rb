class Album < ApplicationRecord
  validates :title, :year,  presence: true

  belongs_to :band, dependent: :destroy,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  foreign_key: :album_id,
  class_name: :Track


end
