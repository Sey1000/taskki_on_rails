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

  test "should create task" do
    assert_difference('Task.count', +1) do
      post tasks_url, params: { task: { title: 'testing task title!', due: 'Sep 21' } }
    end
  end
  # post :create do sth
  # Task.count == 1
end
