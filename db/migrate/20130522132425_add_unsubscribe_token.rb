class AddUnsubscribeToken < ActiveRecord::Migration
  def change
    add_column :newsletter_subscribers, :unsubscribe_token, :string
  end
end
