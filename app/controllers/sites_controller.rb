class SitesController < ApplicationController
  before_action :find_site, only: [:show, :edit, :destroy, :update, :generate_img, :view, :bare_view]

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
    respond_to do |format|
      if @site.generate_img bare_view_url(@site)
        format.html { 
          redirect_to sites_path, notice: "successfully generate the image!"
        }
        format.json { render json: { :success => true, status: 200 } }
      else
        format.html { 
          render :index, notice: "something wrong when generate the image!!"
        }
        format.js
      end 
    end
  end

  def view
    respond_to do |format|
      format.js
      format.html { render layout: "bare_heat_img_layout" }
    end
  end

  def bare_view
    respond_to do |format|
      format.html { render layout: "bare_heat_img_layout" }
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
