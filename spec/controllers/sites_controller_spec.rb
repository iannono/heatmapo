require 'spec_helper'

describe SitesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
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
