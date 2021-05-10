class RemoveDiscountFromDiscount < ActiveRecord::Migration[6.1]
  def change
    remove_column :discounts, :discount, :decimal
  end
end
