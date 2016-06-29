class RenameProjectPlaceToLocation < ActiveRecord::Migration
  def change
  	rename_column :projects, :place, :location
  end
end
