class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.decimal :fee

      t.timestamps
    end
  end
end
