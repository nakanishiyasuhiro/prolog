class AddIndexToProgramminglogs < ActiveRecord::Migration[5.2]
  def change
    add_index :programminglogs, :text, length: 32
  end
end
