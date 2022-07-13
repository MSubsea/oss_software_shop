class AddCustomerToSoftware < ActiveRecord::Migration[6.1]
  def change
    add_reference :softwares, :customer, foreign_key: true
  end
end
