require 'rails_helper'

feature "Comments", :type => :feature do
  scenario "visit to post comments" do
    comment = create :comment

    visit post_comments_path(comment.post)
    expect(page).to have_text(comment.body)
  end

end
