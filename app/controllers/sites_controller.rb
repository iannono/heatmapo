class SitesController < ApplicationController
  before_action :find_site, only: [:show, :edit, :destroy, :update]

  def index
    @sites = Site.all
  end

  def show
  end

  def create
    @site = Site.new site_params
    if @site.save
      redirect_to sites_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @site.update_attributes(site_params) 
      redirect_to sites_path
    else
      render :edit
    end
  end

  def new
    @site = Site.new
  end

  def destroy
  end 

private
  def find_site
    @site = Site.find params[:id]
  end

  def site_params
    params.require(:site).permit(:name, :url, :width, :height)
  end
end
