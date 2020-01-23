class AddFieldsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :current_donation_amount, :integer, default: 0
    add_column :projects, :expires_at, :datetime, default: DateTime.now + 30.days
    add_column :projects, :status, :string, default: "active"
  end
end
