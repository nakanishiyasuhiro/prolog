class ChangeColumnToProgramminglog < ActiveRecord::Migration[5.2]
  def change
    change_column_null :programminglogs, :title, false
    change_column_null :programminglogs, :text, false
    change_column_null :programminglogs, :user_id, false
    change_column_null :programminglogs, :image, false
  end
end
