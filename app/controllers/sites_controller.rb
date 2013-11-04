class SitesController < ApplicationController
  before_action :find_site, only: [:show, :edit, :destroy, :update, :generate_img]

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
    @site.destroy
    redirect_to sites_path
  end 

  def generate_img 
    if @site.generate_img 
      redirect_to sites_path, notice: "successfully generate the image!"
    else
      render :index, notice: "something wrong when generate the image!!"
    end 
  end

private
  def find_site
    @site = Site.find params[:id]
  end

  def site_params
    params.require(:site).permit(:name, :url, :width, :height)
  end
end
