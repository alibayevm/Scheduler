require 'test_helper'

class TimeslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timeslots_show_url
    assert_response :success
  end

  test "should get new" do
    get timeslots_new_url
    assert_response :success
  end

  test "should get create" do
    get timeslots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get timeslots_destroy_url
    assert_response :success
  end

end
