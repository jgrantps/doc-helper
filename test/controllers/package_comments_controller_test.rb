require 'test_helper'

class PackageCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get package_comments_index_url
    assert_response :success
  end

  test "should get new" do
    get package_comments_new_url
    assert_response :success
  end

  test "should get edit" do
    get package_comments_edit_url
    assert_response :success
  end

end
