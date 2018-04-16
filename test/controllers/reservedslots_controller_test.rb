require 'test_helper'

class ReservedslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get reservedslots_show_url
    assert_response :success
  end

  test "should get new" do
    get reservedslots_new_url
    assert_response :success
  end

  test "should get create" do
    get reservedslots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get reservedslots_destroy_url
    assert_response :success
  end

end
