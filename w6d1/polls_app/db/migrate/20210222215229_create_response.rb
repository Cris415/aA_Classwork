class CreateResponse < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :question_id, null: false
      t.timestamps
    end

    add_index :responses, :answer_choice_id, unique: false
    add_index :responses, :question_id, unique: false
  end
end
