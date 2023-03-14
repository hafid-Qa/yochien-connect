require "test_helper"

class Api::V1::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_children_index_url
    assert_response :success
  end
end
