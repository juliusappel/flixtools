require "test_helper"

class ApplianceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appliance_index_url
    assert_response :success
  end

  test "should get show" do
    get appliance_show_url
    assert_response :success
  end

  test "should get new" do
    get appliance_new_url
    assert_response :success
  end

  test "should get create" do
    get appliance_create_url
    assert_response :success
  end

  test "should get edit" do
    get appliance_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get appliance_destroy_url
    assert_response :success
  end
end
