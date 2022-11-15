require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get tool:references" do
    get bookings_tool:references_url
    assert_response :success
  end

  test "should get user:references" do
    get bookings_user:references_url
    assert_response :success
  end

  test "should get starting_date:date" do
    get bookings_starting_date:date_url
    assert_response :success
  end

  test "should get end_date:date" do
    get bookings_end_date:date_url
    assert_response :success
  end

  test "should get status:integer" do
    get bookings_status:integer_url
    assert_response :success
  end
end
