require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "check h1" do
    visit '/'
    assert_selector "h1", text: "Tasks"
  end
end
