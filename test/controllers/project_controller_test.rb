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
    assert_equal([
      {
        "Project School Name": "I.S. 254 - BRONX test search string",
        "Project Description": "FACADE/ROOFS",
        "Project Phase Actual Start Date": "07/07/2016",
        "Project Phase Planned End Date": "03/28/2018",
        "Project Phase Actual End Date": "",
        "Project Budget Amount": "4050000",
        "Final Estimate of Actual Costs Through End of Phase Amount": 4229193,
        "Total Phase Actual Spending Amount": 3791127
      },
      {
        "Project School Name": "I.S. 254 - BRONX",
        "Project Description": "FACADE/ROOFS test search string",
        "Project Phase Actual Start Date": "07/07/2016",
        "Project Phase Planned End Date": "03/28/2018",
        "Project Phase Actual End Date": "",
        "Project Budget Amount": "252000",
        "Final Estimate of Actual Costs Through End of Phase Amount": 489326,
        "Total Phase Actual Spending Amount": 485620
      }
    ], response.body)
  end
end
