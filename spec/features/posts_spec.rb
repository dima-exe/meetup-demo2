require 'rails_helper'

feature "Posts", :type => :feature do
  scenario "visit to posts" do
    post = create :post

    visit posts_path

    expect(page).to have_text(post.title)
    expect(page).to have_text(post.body)
  end

  scenario "create a new post" do
    visit new_post_path
    expect(page.status_code).to eq 200

    within("#new_post") do
      fill_in 'Title', with: "New post title"
      fill_in 'Body', with: "New post body"
      click_button 'Create Post'
    end

    post = Post.find_by title: 'New post title'
    expect(post).to be
  end
end

