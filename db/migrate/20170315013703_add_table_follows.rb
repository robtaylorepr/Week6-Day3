class AddTableFollows < ActiveRecord::Migration[5.0]
  def change
    create_table "follows", force: :cascade do |t|
      t.string   "follower_type"
      t.integer  "follower_id"
      t.string   "followable_type"
      t.integer  "followable_id"
      t.datetime "created_at"
      t.index ["followable_id", "followable_type"], name: "fk_followables"
      t.index ["follower_id", "follower_type"], name: "fk_follows"
    end
  end
end
