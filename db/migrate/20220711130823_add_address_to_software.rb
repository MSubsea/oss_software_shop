class AddAddressToSoftware < ActiveRecord::Migration[6.1]
  def change
    add_column :softwares, :address, :string
  end
end
