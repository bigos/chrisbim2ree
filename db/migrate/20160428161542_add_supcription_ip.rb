class AddSupcriptionIp < ActiveRecord::Migration
  def up
    add_column :newsletter_subscribers, :subscriber_ip, :string
  end

  def down
    remove_column :newsletter_subscribers, :subscriber_ip
  end
end
