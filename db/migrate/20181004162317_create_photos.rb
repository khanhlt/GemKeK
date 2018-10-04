class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image, null: false
      t.integer :game_id, null: false
      t.timestamps
    end
  end
end
