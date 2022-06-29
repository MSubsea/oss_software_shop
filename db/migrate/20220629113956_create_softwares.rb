class CreateSoftwares < ActiveRecord::Migration[6.1]
  def change
    create_table :softwares do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
