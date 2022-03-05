require 'rails_helper'

describe "User sees activities", type: :feature do
  it "successfully" do
    visit activities_path

    expect(page).to have_css 'h1', text: 'Activities'
  end
end
