require 'rails_helper'

RSpec.feature "Authentication", type: :feature do
  scenario "User signs up and then creates a new task" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
    sleep 2
    # Navigate to the index page (or wherever your task button is)
    visit root_path

    # Click on the "New Task" button (or link)
    click_link "Create a new task"  # Adjust based on your actual button/link text or selector
    sleep 1
    # Fill in the task form
    fill_in "task[title]", with: "New Task"
    fill_in "task[description]", with: "This is a new task."
    select "Done", from: "task[status]"  # Adjust if your statuses are different


    click_button "Create Task"

    expect(page).to have_text("Task was successfully created.")
    sleep 2
    click_link "Edit Task"

    # Fill in the task form
    fill_in "task[title]", with: "New Task updated"
    fill_in "task[description]", with: "This is a new task updated."
    select "Backlog", from: "task[status]"  # Adjust if your statuses are different

    click_button "Update Task"

    expect(page).to have_text("Task was successfully updated.")
    sleep 2
    click_button "Destroy this task"
    sleep 2
    click_link "Logout"
    sleep 2
  end

end
