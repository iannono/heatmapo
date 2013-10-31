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
  end


  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  #describe "GET 'update'" do
  #  it "returns http success" do
  #    put 'update', site: attributes_for(:site)
  #    response.should be_success
  #  end
  #end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  #describe "GET 'destroy'" do
  #  it "returns http success" do
  #    Delete 'destroy'
  #    response.should be_success
  #  end
  #end

  #describe "GET 'show'" do
  #  it "returns http success" do
  #    get 'show', site: create(:site)
  #    response.should be_success
  #  end
  #end

end
