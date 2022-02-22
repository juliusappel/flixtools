require "test_helper"

class BookingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get booking_create_url
    assert_response :success
  end

  test "should get request_confirmation" do
    get booking_request_confirmation_url
    assert_response :success
  end
end
