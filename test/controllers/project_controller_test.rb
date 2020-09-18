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

  test "index should return projects with school_name or description matching search string" do
    get project_index_url(search: 'test search string')
    assert_response :success
    
    assert_equal(['I.S. 254 - BRONX test search string', 'I.S. 254 - BRONX'], JSON.parse(response.body).map {|p| p['school_name'] })
  end

  test "index should filter on Project Phase Actual Start Date" do
    get project_index_url(phase_actual_start_date: '07/07/2016')
    assert_response :success

    assert_equal(['I.S. 254 - BRONX test search string', 'I.S. 254 - BRONX', "DEWITT CLINTON HS - X", "DEWITT CLINTON HS - X", "P.S. 14 - BRONX", "P.S. 14 - BRONX", "P.S. 130 - MANHATTAN", "MULTICULTURAL HS - BROOKLYN"], JSON.parse(response.body).map {|p| p['school_name'] })
  end

  test "should update phase_actual_start_date and total_phase_actual_spending" do
    project = Project.first
    put project_url(
      project,
      {
        phase_actual_start_date: project.phase_actual_start_date + 1.day,
        total_phase_actual_spending: project.total_phase_actual_spending + 100000000
      }
    )
    assert_response :success

    response_project = JSON.parse(response.body)['project']
    assert_equal((project.phase_actual_start_date + 1.day).to_s, response_project['phase_actual_start_date'])
    assert_equal(project.total_phase_actual_spending + 100000000, response_project['total_phase_actual_spending'])
  end
end
