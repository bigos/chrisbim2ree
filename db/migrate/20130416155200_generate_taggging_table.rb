class GenerateTagggingTable < ActiveRecord::Migration
  def change
    create_table "taggings", :force => true do |t|
      t.integer  "photo_id"
      t.integer  "tag_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
