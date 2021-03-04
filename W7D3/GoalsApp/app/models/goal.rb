class Goal < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :user_id}
    validates :body, presence: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

    has_many :comments,
    foreign_key: :goal_id,
    class_name: :Comment
    
end
