require 'test_helper'

class PackageCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get package_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get package_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get package_comments_show_url
    assert_response :success
  end

  test "should get update" do
    get package_comments_update_url
    assert_response :success
  end

  test "should get delete" do
    get package_comments_delete_url
    assert_response :success
  end

  test "should get edit" do
    get package_comments_edit_url
    assert_response :success
  end

end
