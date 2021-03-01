class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist, 
        foreign_key: :artist_id,
        class_name: :User
    
    has_many :shares, 
        foreign_key: :artist_id, 
        class_name: :ArtworkShare

    has_many :shared_viewers, 
        through: :shares, 
        source: :viewer
    
end 