require "test_helper"

class DiscountTest < ActiveSupport::TestCase
  def setup
    @percent_discount = discounts(:percent_discount)
    @amount_discount = discounts(:amount_discount)
  end

  test 'valid discount' do
    assert @percent_discount.valid?
    assert @amount_discount.valid?
  end

  test 'invalid without percentage to discount' do
    @percent_discount.percentage_discount = nil
    refute @percent_discount.valid?, 'image is valid without a percentage to discount'
    assert_not_nil @percent_discount.errors[:name], 'no validation error for percentage to discount present'
  end

  test 'invalid without amount to discount' do
    @amount_discount.amount_discount = nil
    refute @amount_discount.valid?, 'image is valid without an amount to discount'
    assert_not_nil @amount_discount.errors[:name], 'no validation error for amount to discount present'
  end
end
