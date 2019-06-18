require 'test_helper'

class TimetrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetracking = timetrackings(:one)
  end

  test "should get index" do
    get timetrackings_url
    assert_response :success
  end

  test "should get new" do
    get new_timetracking_url
    assert_response :success
  end

  test "should create timetracking" do
    assert_difference('Timetracking.count') do
      post timetrackings_url, params: { timetracking: { checkout: @timetracking.checkout, duration: @timetracking.duration, latitude: @timetracking.latitude, longitude: @timetracking.longitude } }
    end

    assert_redirected_to timetracking_url(Timetracking.last)
  end

  test "should show timetracking" do
    get timetracking_url(@timetracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetracking_url(@timetracking)
    assert_response :success
  end

  test "should update timetracking" do
    patch timetracking_url(@timetracking), params: { timetracking: { checkout: @timetracking.checkout, duration: @timetracking.duration, latitude: @timetracking.latitude, longitude: @timetracking.longitude } }
    assert_redirected_to timetracking_url(@timetracking)
  end

  test "should destroy timetracking" do
    assert_difference('Timetracking.count', -1) do
      delete timetracking_url(@timetracking)
    end

    assert_redirected_to timetrackings_url
  end
end
