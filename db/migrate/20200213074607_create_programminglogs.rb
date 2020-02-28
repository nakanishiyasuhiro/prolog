class CreateProgramminglogs < ActiveRecord::Migration[5.2]
  def change
    create_table :programminglogs do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
