class AddPublishedAndNameToComment < ActiveRecord::Migration
  def change
    add_column :comments, :name, :string
    add_column :comments, :published, :boolean
  end
end
