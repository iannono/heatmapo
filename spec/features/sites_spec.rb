require 'lib/heat_handler'
require 'spec_helper'

feature "Site management" do
  context "add a new site" do
    scenario "with invalid site properites" do

      visit root_path
      click_link 'Add New Site' 

      expect {
        click_button 'Submit' 
      }.to_not change(Site, :count).by(1)

      expect(current_path).to eq sites_path
    end

    scenario "with valid site properites" do 
      site = build :site
      visit root_path
      click_link 'Add New Site' 

      expect {
        fill_in 'SITE NAME', with: site.name
        fill_in 'SITE URL', with: site.url
        click_button 'Submit' 
      }.to change(Site, :count).by(1)

      expect(current_path).to eq sites_path
    end
  end

  context "update site" do
    scenario "with valid properites" do 
      site = create :site
      visit root_path
      click_link "edit_site_#{site.id}" 

      fill_in 'SITE NAME', with: "simple site"
      click_button 'Submit' 

      site.reload
      expect(site.name).to eq "simple site"
    end

    scenario "with invalid properites" do 
      site = create :site
      visit root_path
      click_link "edit_site_#{site.id}" 

      fill_in 'SITE NAME', with: nil
      click_button 'Submit' 

      site.reload
      expect(site.name).to_not eq nil
    end
  end

  scenario "generate site img" do
    site = create :site, name: "www.sample.com", 
                  url: "http://www.sample.com", width: 0, height: 0
    visit root_path

    allow(HeatHandler).to receive(:handle_site_and_return_size)
                      .with(site.url)
                      .and_return(["700", "455"])

    click_link "generate_site_#{site.id}" 

    site.reload
    expect(site.width).to eq 700
    expect(site.height).to eq 455
  end

  scenario "view site's heatmap" do
    site = create :site, name: "www.doesnotexsit.com",
                  url: "http://www.doesnotexsit.com" 
    visit root_path 

    allow(HeatHandler).to receive(:handle_site_and_return_size)
                      .with(site.url)
                      .and_return(["700", "455"]) 
    click_link "view_site_#{site.id}" 

    expect(page).to have_content(site.name + "'s heat map'") 
    expect(page).to have_content("Download Img")
  end
end
