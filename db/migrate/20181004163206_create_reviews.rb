class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content, null: false
      t.integer :rating
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.timestamps
    end
  end
end
