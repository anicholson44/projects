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

  test "should return projects with school_name or description matching search string" do
    get project_index_url(search: 'test search string')
    assert_response :success
    
    assert_equal(['I.S. 254 - BRONX test search string', 'I.S. 254 - BRONX'], JSON.parse(response.body).map {|p| p['school_name'] })
  end
end
