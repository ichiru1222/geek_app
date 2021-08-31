class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :artist
      t.string :video
      t.text :coment
      t.integer :user_id
      t.text :other_coment

      t.timestamps
    end
  end
end
