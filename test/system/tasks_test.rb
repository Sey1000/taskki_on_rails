require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "check h1" do
    visit '/'
    # save_and_open_screenshot
    assert_selector "h1", text: "Tasks"
    assert_selector ".task", count: Task.count
  end

  test "lets a signed in user create a new task" do
    login_as users(:one)
    visit '/tasks/new'

    fill_in 'task_title', with: "Lunch with Sey"
    fill_in 'task_due', with: "Sep 18"
    click_on 'Create Task'

    assert_equal root_path, page.current_path
    assert_text "Lunch with Sey"
  end
end
