class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :caption
      t.integer :position
      t.boolean :visible
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end
end
