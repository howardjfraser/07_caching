require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get people_path
    assert_response :success
  end
end
