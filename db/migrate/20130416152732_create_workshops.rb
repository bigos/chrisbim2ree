class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.integer :duration
      t.string :title
      t.text :content
      t.date :start_date

      t.timestamps
    end
  end
end
