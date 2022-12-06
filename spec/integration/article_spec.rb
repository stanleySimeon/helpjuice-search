require 'rails_helper'

RSpec.describe "User", type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(email: "example@gmail.com", password: "123456", password_confirmation: "123456")
    @user.save
    @article = Article.create(title: "Title", description: "Description", user_id: @user.id)

    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: "example@gmail.com"
      fill_in "Password", with: "123456"
    end
    find_button("Log In").click
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
    expect(@article).to be_valid
  end

  it "can browse to new article page" do
    visit new_article_path
    expect(page).to have_content("New article")
  end

  it "can create a new article" do
    click_link ("New Article")
    fill_in "Title", with: "Title"
    fill_in "Description", with: "Description"
    find_button("Create Article").click
    expect(page).to have_content("Article was successfully created.")
  end

  it "can browse to edit article page" do
    visit edit_article_path(@article)
    expect(page).to have_content("Editing article")
  end

  it "can edit an article" do
    visit edit_article_path(@article)
    fill_in "Title", with: "Title"
    fill_in "Description", with: "Description"
    find_button("Update Article").click
    expect(page).to have_content("Article was successfully updated.")
  end

  it "can delete an article" do
    visit article_path(@article)
    find_button("Delete").click
    expect(page).to have_content("Article was successfully destroyed.")
  end
end
