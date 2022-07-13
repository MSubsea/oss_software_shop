class AddCoordinatesToSoftware < ActiveRecord::Migration[6.1]
  def change
    add_column :softwares, :latitude, :float
    add_column :softwares, :longitude, :float
  end
end
