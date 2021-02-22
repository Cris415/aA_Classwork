class CreateAnswerChoice < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.string :choice, null: false
      t.timestamps
    end

    add_index :answer_choices, :question_id, unique: false
  end
end
