# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_203810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_dislikes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_dislikes_on_comment_id"
    t.index ["user_id"], name: "index_comment_dislikes_on_user_id"
  end

  create_table "comment_favorites", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_favorites_on_comment_id"
    t.index ["user_id"], name: "index_comment_favorites_on_user_id"
  end

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["user_id"], name: "index_comment_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_dislikes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_dislikes_on_post_id"
    t.index ["user_id"], name: "index_post_dislikes_on_user_id"
  end

  create_table "post_favorites", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_favorites_on_post_id"
    t.index ["user_id"], name: "index_post_favorites_on_user_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["user_id"], name: "index_post_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "message"
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reply_dislikes", force: :cascade do |t|
    t.bigint "reply_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reply_id"], name: "index_reply_dislikes_on_reply_id"
    t.index ["user_id"], name: "index_reply_dislikes_on_user_id"
  end

  create_table "reply_favorites", force: :cascade do |t|
    t.bigint "reply_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reply_id"], name: "index_reply_favorites_on_reply_id"
    t.index ["user_id"], name: "index_reply_favorites_on_user_id"
  end

  create_table "reply_likes", force: :cascade do |t|
    t.bigint "reply_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reply_id"], name: "index_reply_likes_on_reply_id"
    t.index ["user_id"], name: "index_reply_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comment_dislikes", "comments"
  add_foreign_key "comment_dislikes", "users"
  add_foreign_key "comment_favorites", "comments"
  add_foreign_key "comment_favorites", "users"
  add_foreign_key "comment_likes", "comments"
  add_foreign_key "comment_likes", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "post_dislikes", "posts"
  add_foreign_key "post_dislikes", "users"
  add_foreign_key "post_favorites", "posts"
  add_foreign_key "post_favorites", "users"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "post_likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
  add_foreign_key "reply_dislikes", "replies"
  add_foreign_key "reply_dislikes", "users"
  add_foreign_key "reply_favorites", "replies"
  add_foreign_key "reply_favorites", "users"
  add_foreign_key "reply_likes", "replies"
  add_foreign_key "reply_likes", "users"
end
