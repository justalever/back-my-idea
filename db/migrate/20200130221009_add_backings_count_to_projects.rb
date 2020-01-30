class AddBackingsCountToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :backings_count, :integer, default: 0
  end
end
