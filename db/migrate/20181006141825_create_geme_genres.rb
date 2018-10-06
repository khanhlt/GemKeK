class CreateGemeGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :game_genres do |t|
      t.integer :genre_id, null: false
      t.integer :game_id, null: false

      t.timestamps
    end
  end
end
