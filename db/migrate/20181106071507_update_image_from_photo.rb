class UpdateImageFromPhoto < ActiveRecord::Migration[5.2]
  def change
  	remove_column :photos, :image
  	add_column :photos, :image, :string
  end
end
