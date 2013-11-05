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
    context "with valid attributes" do
      it "saves the new site in the database" do
        expect{
          post :create, site: attributes_for(
            :site,
            name: "qq",
            url: "http://www.qq.com"
          )
        }.to change(Site, :count).by(1)
      end

      it "redirect to site#index" do
        post :create, site: attributes_for(
          :site,
          name: "qq",
          url: "http://www.qq.com"
        ) 
        expect(response).to redirect_to sites_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new site in the database" do
        expect{
          post :create, site: attributes_for(:invalid_site)
        }.to_not change(Site, :count) 
      end

      it "re-renders the :new template" do
        post :create, site: attributes_for(:invalid_site)
        expect(response).to render_template :new 
      end
    end 
  end 

  describe "Patch #update" do
    before :each do
      @site = create :site, name: "tencent", url: "http://www.qq.com"
    end

    context "with valid attributes" do
      it "located the requested @site" do
        patch :update, id: @site, site: attributes_for(:site)
        expect(assigns :site).to eq @site
      end

      it "changes @site's attributes" do
        patch :update, id: @site,
          site: attributes_for(:site,
                               name: "baidu", url: "http://www.baidu.com")

        @site.reload
        expect(@site.name).to eq "baidu"
        expect(@site.url).to eq "http://www.baidu.com" 
      end

      it "redirect to index path" do
        patch :update, id: @site, site: attributes_for(:site)
        expect(response).to redirect_to sites_path
      end
    end

    context "with invalid attributes" do
      it "does not change @site's attributes" do
        patch :update, id: @site,
          site: attributes_for(:site,
                               name: "baidu", url: nil)

        @site.reload
        expect(@site.name).to_not eq "baidu"
        expect(@site.name).to eq "tencent"
      end

      it "re-renders the :edit template" do
        patch :update, id: @site, site: attributes_for(:invalid_site)
      end
    end
  end

  describe "Delete #destroy" do
    before :each do
      @site = create(:site)
    end

    it "delete the @site" do 
      expect {
        delete :destroy, id: @site
      }.to change(Site, :count).by(-1)
    end

    it "redirect to index path" do
      delete :destroy, id: @site
      expect(response).to redirect_to sites_path
    end
  end

  describe "Get #generate_img" do 
    it "redirect to sites's path" do
      site = create :site, width: 0, height: 0 
      allow(site).to receive(:generate_img)
                      .and_return(true) 

      get :generate_img, id: site 
      expect(response).to redirect_to sites_path
    end
  end
end
