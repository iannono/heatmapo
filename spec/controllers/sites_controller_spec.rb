require 'spec_helper'

describe SitesController do

  describe "Get #show" do 
    it "assigns the requested site to @site" do
      site = create :site
      get :show, id: site 
      expect(assigns :site).to eq site
    end

    it "renders the :show template" do 
      site = create :site
      get :show, id: site 
      expect(response).to render_template :show
    end
  end

  describe "Get #index" do
    it "assigns an array of sites to @sites" do
      baidu = create(:site, name: "baidu", url: "http://www.baidu.com")
      google = create(:site, name: "google", url: "http://www.google.com")

      get :index
      expect(assigns :sites).to eq [baidu, google]
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end 

  describe "Get #new" do
    it "assigns a new site to @site" do
      get :new
      expect(assigns :site).to be_a_new(Site)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "Get #edit" do
    it "assigns the requested site to @site" do
      site = create(:site)
      get :edit, id: site
      expect(assigns :site).to eq site
    end

    it "renders the :edit template" do
      site = create(:site)
      get :edit, id: site
      expect(response).to render_template :edit
    end
  end 

  describe "Post #create" do
    before :each do
    end 
  end
end
