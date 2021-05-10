class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :body
      t.text :tags, array: true
      t.decimal :price
      t.decimal :discount_price
      t.boolean :discount, default: false

      t.timestamps
    end
  end
end
