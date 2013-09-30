class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.float :xpoint
      t.float :ypoint

      t.timestamps
    end
  end
end
