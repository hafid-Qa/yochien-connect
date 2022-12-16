require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get children_create_url
    assert_response :success
  end

  test "should get index" do
    get children_index_url
    assert_response :success
  end

  test "should get update" do
    get children_update_url
    assert_response :success
  end

  test "should get cancel_transport" do
    get children_cancel_transport_url
    assert_response :success
  end
end
