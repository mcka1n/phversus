# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140219033841) do

  create_table "distillates", force: true do |t|
    t.string   "media_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: true do |t|
    t.string   "instagram_id"
    t.string   "instagram_user_id"
    t.string   "instagram_link"
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.string   "tags"
    t.string   "content_type"
    t.string   "small"
    t.string   "medium"
    t.string   "large"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instagram_user_profile_picture"
    t.string   "instagram_user_username"
    t.string   "instagram_media_created_at"
  end

  add_index "media", ["instagram_user_id"], name: "index_media_on_instagram_user_id"

  create_table "pools", force: true do |t|
    t.string   "instagram_id"
    t.string   "instagram_user_id"
    t.string   "instagram_link"
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.string   "content_type"
    t.string   "small"
    t.string   "medium"
    t.string   "large"
    t.string   "instagram_user_profile_picture"
    t.string   "instagram_user_username"
    t.string   "instagram_media_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.integer  "phone"
    t.string   "current_city"
    t.string   "address"
    t.integer  "zip"
    t.text     "about"
    t.string   "school"
    t.string   "employer"
    t.string   "languages"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "instagram"
    t.string   "youtube"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.boolean  "vote",          default: false, null: false
    t.integer  "voteable_id",                   null: false
    t.string   "voteable_type",                 null: false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], name: "fk_one_vote_per_user_per_entity", unique: true
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type"

end
