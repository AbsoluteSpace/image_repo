require "test_helper"

class ImageTest < ActiveSupport::TestCase
  def setup
    @image = images(:valid)
  end

  test 'valid image' do
    assert @image.valid?
  end

  test 'invalid without title' do
    @image.title = nil
    refute @image.valid?, 'image is valid without a title'
    assert_not_nil @image.errors[:name], 'no validation error for title present'
  end

  test 'invalid without body' do
    @image.body = nil
    refute @image.valid?, 'image is valid without a body'
    assert_not_nil @image.errors[:name], 'no validation error for body present'
  end

  test 'invalid without price' do
    @image.price = nil
    refute @image.valid?, 'image is valid without a price'
    assert_not_nil @image.errors[:name], 'no validation error for price present'
  end

  test 'invalid without file location' do
    @image.file_location = nil
    refute @image.valid?, 'image is valid without a file location'
    assert_not_nil @image.errors[:name], 'no validation error for file location present'
  end

  test 'invalid invalid title' do
    @image.title = "??book>"
    refute @image.valid?, 'image can have invalid title'
    assert_not_nil @image.errors[:name], 'no validation error for title present'
  end
end
