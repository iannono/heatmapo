class AddScreenRatioToHeats < ActiveRecord::Migration
  def change
    add_column :heats, :screen_ratio, :string
  end
end
