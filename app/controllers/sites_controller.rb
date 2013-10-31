class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find params[:id]
  end

  def create
  end

  def update
  end

  def new
  end

  def destroy
  end 
end
