class ArtworkShare < ApplicationRecord
    #does this effect viewer and artwork relationship. Multiple viewers 
    validates :artwork_id, uniqueness: {scope: :viewer_id}

    belongs_to :viewer, 
        foreign_key: :viewer_id, 
        class_name: :User

    belongs_to :artwork, 
        foreign_key: :artist_id, 
        class_name: :Artwork
    
end