class Sub < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :user_id, presence: true, uniqueness: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  has_many :posts,
  foreign_key: :sub_id,
  class_name: :Post

end
