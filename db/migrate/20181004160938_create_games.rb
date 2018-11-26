class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :summary
      t.datetime :relase_date
      t.string :link1
      t.string :link2
      t.string :link3
      t.string :developer
      t.timestamps
    end
  end
end
