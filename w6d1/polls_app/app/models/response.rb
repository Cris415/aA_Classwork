# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  question_id      :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class: :AnswerChoice

  # belongs_to :question
  # primary_key: :id,
  # foreign_key: :question_id,
  # class: :Question

  

end

