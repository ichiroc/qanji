class AddWidthAndHeightToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :width, :integer
    add_column :images, :height, :integer
  end
end
