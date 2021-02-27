require action_view

class Cat < ApplicationRecord

  include ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, :sex, :description, presence: true

  validates :color, inclusion: {in: ["Brown", "Grey", "Black", "Orange"], message: "%{value} Is not a valid color."}
  validates :sex, inclusion: {in: ["M", "F"], message: "%{value} Is not a valid sex."}

  def age 
    # (Date.today.year - birth_date.year).floor
    time_ago_in_words(Time.now - birth_date)
  end












end
