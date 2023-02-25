require "test_helper"

class Admin::PostItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_post_items_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_post_items_index_url
    assert_response :success
  end
end
