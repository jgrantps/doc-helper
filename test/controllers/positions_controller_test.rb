require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get positions_new_url
    assert_response :success
  end

  test "should get create" do
    get positions_create_url
    assert_response :success
  end

  test "should get update" do
    get positions_update_url
    assert_response :success
  end

  test "should get delete" do
    get positions_delete_url
    assert_response :success
  end

  test "should get index" do
    get positions_index_url
    assert_response :success
  end

  test "should get show" do
    get positions_show_url
    assert_response :success
  end

  test "should get edit" do
    get positions_edit_url
    assert_response :success
  end

end
