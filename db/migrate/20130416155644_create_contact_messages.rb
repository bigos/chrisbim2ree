class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :from
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
