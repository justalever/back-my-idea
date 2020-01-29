class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.string :title
      t.decimal :amount, precision: 8, scale: 2, default: 0
      t.text :description
      t.integer :quantity
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
