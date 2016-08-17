class CreateJobLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :job_logs do |t|
      t.string :key, null: false
      t.integer :status, null: false
      t.datetime :queue_time, null: false
      t.string :message
      t.text :raw_text, null: false
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
