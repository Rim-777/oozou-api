ActiveRecord::Schema.define(version: 2019_02_17_211858) do
  enable_extension "plpgsql"
  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "title", null: false
    t.datetime "published_at", null: false
    t.text "summary", null: false
    t.text "content", null: false
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_contents_on_author_id"
    t.index ["status"], name: "index_contents_on_status"
  end
end
