class DropMerchantsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table "merchants", force: :cascade do |t|
      t.string "title"
      t.string "description"
      t.integer "user_id", null: false
      t.decimal "fee"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_merchants_on_user_id"
      t.foreign_key "users"
    end
  end
end
