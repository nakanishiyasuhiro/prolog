class AddNumcountToProgramminglog < ActiveRecord::Migration[5.2]
  def change
    add_column :programminglogs, :likes_count, :integer
  end
end
