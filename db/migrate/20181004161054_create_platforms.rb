class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :name
      t.float :version

      t.timestamps
    end
  end
end
