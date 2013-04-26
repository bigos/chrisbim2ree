class AddCategoryNameToTags < ActiveRecord::Migration
  def change
    add_column :tags, :category_name, :string
  end
end
