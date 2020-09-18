require 'test_helper'

class ProjectControllerTest < ActiveSupport::TestCase
  include ActionDispatch::IntegrationTest::Behavior

  test "should get index" do
    get project_index_url
    assert_response :success
  end

  test "should put update" do
    put project_url(Project.first)
    assert_response :success
  end
end
