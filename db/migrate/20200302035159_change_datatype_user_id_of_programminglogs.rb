class ChangeDatatypeUserIdOfProgramminglogs < ActiveRecord::Migration[5.2]
  def change
    change_column :programminglogs, :user_id, :integer
  end
end
