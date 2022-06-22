require "test_helper"

class CartNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_numbers_show_url
    assert_response :success
  end

  test "should get new" do
    get cart_numbers_new_url
    assert_response :success
  end

  test "should get edit" do
    get cart_numbers_edit_url
    assert_response :success
  end

  test "should get index" do
    get cart_numbers_index_url
    assert_response :success
  end
end
