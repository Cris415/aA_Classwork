class CreateAnswerChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_choices do |t|

      t.timestamps
    end
  end
end
