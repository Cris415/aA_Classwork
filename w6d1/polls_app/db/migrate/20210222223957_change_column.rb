class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :responses, :question_id, :user_id
  end
end
