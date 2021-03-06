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
    login_as users(:one)
    assert_difference('Task.count', +1) do
      post tasks_url, params: { task: { title: 'testing task title', due: 'Sep 21' } }
    end
  end

  test "should render form if not saved" do
    login_as users(:one)
    assert_no_difference('Task.count') do
      post tasks_url, params: { task: { title: nil, due: nil } }
    end

    assert_template :new
  end
end
