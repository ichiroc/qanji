class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file_name, null: false
      t.string :content_type, null: false
      t.binary :data, null: false
      t.string :job_key

      t.timestamps
    end
  end
end
