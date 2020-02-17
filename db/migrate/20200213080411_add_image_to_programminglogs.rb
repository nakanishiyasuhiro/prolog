class AddImageToProgramminglogs < ActiveRecord::Migration[5.2]
  def change
    add_column :programminglogs, :image, :text
  end
end
