class CreateCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinates do |t|
      t.float :x, null: false
      t.float :y, null: false
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
