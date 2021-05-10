class ChangeTagsToTextOnImage < ActiveRecord::Migration[6.1]
  def change
    change_column :images, :tags, :text, default: "[]"
  end
end
