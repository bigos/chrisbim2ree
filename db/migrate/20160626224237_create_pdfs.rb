class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :title
      t.has_attached_file :pdf_attachment

      t.timestamps
    end
  end
end
