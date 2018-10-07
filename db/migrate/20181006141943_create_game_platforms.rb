class CreateGamePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :game_platforms do |t|
      t.integer :game_id, null: false
      t.integer :platform_id, null: false

      t.timestamps
    end
  end
end
