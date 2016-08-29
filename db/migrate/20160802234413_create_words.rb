class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :text, null: false
      t.string :english
      t.float :score
      t.string :category
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
