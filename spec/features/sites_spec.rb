require 'spec_helper'

feature "Site management" do
  scenario "add a new site" do
    site = create :site

    visit root_path
    click_link 'Add New Site' 

    expect {
      fill_in 'SITE NAME', with: site.name
      fill_in 'SITE URL', with: site.url
      click_button 'ADD' 
    }.to change(Site, :count).by(1)
  end
end
