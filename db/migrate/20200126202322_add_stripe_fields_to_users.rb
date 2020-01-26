class AddStripeFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :access_code, :string
    add_column :users, :publishable_key, :string
  end
end
