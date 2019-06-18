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
      post timetrackings_url, params: { timetracking: { checkin: @timetracking.checkin, latitude: @timetracking.latitude, longitude: @timetracking.longitude } }
    end

    assert_redirected_to timetracking_url(Timetracking.last)
  end

  test "should show timetracking" do
    get timetracking_url(@timetracking)
    assert_response :success
  end

  test "should update timetracking" do
    patch timetracking_url(@timetracking), params: { timetracking: { checkin: @timetracking.checkin, latitude: @timetracking.latitude, longitude: @timetracking.longitude } }
    assert_redirected_to timetracking_url(@timetracking)
  end
end
