class Comment < ApplicationRecord
  validates :user_id, :goal_id, :body, presence: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :goal,
  foreign_key: :goal_id,
  class_name: :Goal


end
