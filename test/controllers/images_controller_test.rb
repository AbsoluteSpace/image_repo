require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @image = images(:valid)
    @post_image = {title: @image.title, body: @image.body, tags: @image.tags, price: @image.price, file_location: @image.file_location}
  end

  test "should get index" do
    get "/"
    assert_response :success
  end

  test "should redirect from new if not admin" do
    get "/images/new"
    assert_response :redirect
    assert_redirected_to "/"

    sign_in users(:user)
    get "/images/new"
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "should get show" do
    get "/images/#{@image.id}"
    assert_response :success
  end

  test "should redirect from create if not admin" do
    post "/images", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"

    sign_in users(:user)
    post "/images", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "should redirect from edit if not admin" do
    get "/images/#{@image.id}/edit"
    assert_response :redirect
    assert_redirected_to "/"

    sign_in users(:user)
    get "/images/#{@image.id}/edit"
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "should redirect from update if not admin" do
    patch "/images/#{@image.id}", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"

    sign_in users(:user)
    patch "/images/#{@image.id}", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "should redirect from destroy if not admin" do
    delete "/images/#{@image.id}", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"

    sign_in users(:user)
    delete "/images/#{@image.id}", params: {image: @post_image}
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "should get purchase" do
    get "/images/purchase/#{@image.id}"
    assert_response :success
  end

  test "should get new if admin" do
    sign_in users(:admin)
    get "/images/new"
    assert_response :success
  end

  test "should post create if admin" do
    sign_in users(:admin)

    post "/images", params: {image: @post_image}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should get edit if admin" do
    sign_in users(:admin)
    get "/images/#{@image.id}/edit"
    assert_response :success
  end

  test "should patch update if admin" do
    sign_in users(:admin)

    patch "/images/#{@image.id}", params: {image: @post_image}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should delete if admin" do
    sign_in users(:admin)

    delete "/images/#{@image.id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
