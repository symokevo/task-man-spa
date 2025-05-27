require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "creating a task" do
    visit tasks_url
    fill_in "Title", with: "Learn Hotwire"
    click_on "Create Task"
    assert_text "Learn Hotwire"
  end

  test "Updating a task" do
    task = Task.create!(title: "Old Task")
    visit tasks_url
    click_on "Edit", match: :first
    fill_in "Title", with: "Updated Task"
    click_on "Update Task"
    assert_text "Updated Task"
  end

  test "Deleting a task" do
    task = Task.create!(title: "To be deleted")
    visit tasks_url
    accept_confirm do
      click_on "Delete", match: :first
    end
    assert_no_text "To be deleted"
  end
end
