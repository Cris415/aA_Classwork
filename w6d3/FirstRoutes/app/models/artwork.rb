class Artwork < ApplicationRecord
    validates :title, uniqueness: {scope: :artist_id}
    validates :image_url, uniqueness:true, presence:true
    validates :artist_id,  presence:true

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