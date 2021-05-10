class AddActiveToDiscount < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :active, :boolean, default: false
  end
end
