class AddFileLocationToImage < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :file_location, :text
  end
end
