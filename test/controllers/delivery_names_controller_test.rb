require "test_helper"

class DeliveryNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get delivery_names_show_url
    assert_response :success
  end

  test "should get new" do
    get delivery_names_new_url
    assert_response :success
  end

  test "should get edit" do
    get delivery_names_edit_url
    assert_response :success
  end

  test "should get index" do
    get delivery_names_index_url
    assert_response :success
  end
end
