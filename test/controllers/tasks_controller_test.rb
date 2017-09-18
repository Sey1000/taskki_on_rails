require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/'
    assert_response :success
  end

  test "should get new" do
    login_as users(:one)
    get '/tasks/new'
    assert_response :success
  end
end
