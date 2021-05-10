class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.decimal :discount
      t.boolean :discount_type, default: 0
      t.decimal :amount_discount, default: 0
      t.decimal :percentage_discount, default: 0
      t.text :tags, default: "[]"
      t.boolean :all_tags, default: false

      t.timestamps
    end
  end
end
