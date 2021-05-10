class AddDiscountsToImage < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :discounts, :text, default: ""
  end
end
