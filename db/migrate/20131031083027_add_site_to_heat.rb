class AddSiteToHeat < ActiveRecord::Migration
  def change
    add_reference :heats, :site, index: true
  end
end
