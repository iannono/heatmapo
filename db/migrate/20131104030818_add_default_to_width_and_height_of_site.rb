class AddDefaultToWidthAndHeightOfSite < ActiveRecord::Migration
  def change
    change_column :sites, :width, :integer, default: 0
    change_column :sites, :height, :integer, default: 0
  end
end
