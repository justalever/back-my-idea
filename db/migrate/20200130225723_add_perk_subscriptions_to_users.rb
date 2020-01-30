class AddPerkSubscriptionsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :perk_subscriptions, :text, array:true, default: []
  end
end
