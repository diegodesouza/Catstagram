require 'rails_helper'

feature "user adds a post", %q{
  As a User
  I want to make a post
  So that I can share my kitty love with the world

  Acceptance Criteria
  [] I must be logged in
  [] I must supply an image
  [] I must upload a image from my computer
  [] I can optionally leave a tweet-length descriptiondo
} do
  scenario "user adds a post with valid attributes" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_post_path
    fill_in "Image", with: "http://www.cats.com/cat1.jpg"
    fill_in "Description", with: "Sleeping cat"
    click_on "Create Post"

    expect(page).to have_content "Post created successfully."
  end

  scenario "user adds a post with invalid attributes" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_post_path
    click_on "Create Post"

    expect(page).to have_content "There were some errors with your Post."
  end
end
