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

ActiveRecord::Schema.define(version: 20160603025329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "featured_projects", force: :cascade do |t|
    t.integer  "talent_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "featured_projects", ["project_id"], name: "index_featured_projects_on_project_id", using: :btree
  add_index "featured_projects", ["talent_id"], name: "index_featured_projects_on_talent_id", using: :btree

  create_table "gallery_pictures", force: :cascade do |t|
    t.integer  "talent_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "position"
  end

  add_index "gallery_pictures", ["talent_id"], name: "index_gallery_pictures_on_talent_id", using: :btree

  create_table "graph_weights", force: :cascade do |t|
    t.string   "context"
    t.string   "taggable_class"
    t.string   "max_tags"
    t.text     "tag_weights"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "graph_weights", ["context", "taggable_class"], name: "index_graph_weights_on_context_and_taggable_class", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["contactable_type", "contactable_id"], name: "index_notes_on_contactable_type_and_contactable_id", using: :btree

  create_table "page_texts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "organised_by_conspirators"
  end

  create_table "projects_talents", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "talent_id",  null: false
  end

  create_table "saved_talents", force: :cascade do |t|
    t.integer "talent_id"
    t.integer "user_id"
  end

  add_index "saved_talents", ["talent_id"], name: "index_saved_talents_on_talent_id", using: :btree
  add_index "saved_talents", ["user_id"], name: "index_saved_talents_on_user_id", using: :btree

  create_table "spoken_languages", force: :cascade do |t|
    t.string   "language"
    t.integer  "level"
    t.integer  "talent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spoken_languages", ["talent_id"], name: "index_spoken_languages_on_talent_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.boolean "acceptable"
    t.string  "slug"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "talents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "middle_name"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.integer  "height"
    t.integer  "age"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "slug"
    t.string   "country_code"
    t.datetime "published"
  end

  add_index "talents", ["slug"], name: "index_talents_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "featured_projects", "projects"
  add_foreign_key "featured_projects", "talents"
  add_foreign_key "saved_talents", "talents"
  add_foreign_key "saved_talents", "users"
  add_foreign_key "spoken_languages", "talents"
end
