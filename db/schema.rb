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

ActiveRecord::Schema.define(version: 20140529145316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "agencies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.text     "address"
    t.string   "logo"
    t.string   "website"
    t.integer  "organization_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.integer  "city_id"
  end

  create_table "answers", force: true do |t|
    t.text     "answer"
    t.integer  "answers_count"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "url"
    t.string   "platform"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "name"
    t.string   "image"
    t.string   "description"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  add_index "categories", ["owner_id", "owner_type"], name: "index_categories_on_owner_id_and_owner_type", using: :btree

  create_table "cities", force: true do |t|
    t.string "arabic_name"
    t.string "english_name"
    t.float  "longitude"
    t.float  "latitude"
  end

  create_table "complaints", force: true do |t|
    t.string   "email"
    t.string   "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "receiver"
  end

  create_table "emails", force: true do |t|
    t.string   "email"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["owner_id", "owner_type"], name: "index_emails_on_owner_id_and_owner_type", using: :btree

  create_table "eservices", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "logo"
  end

  add_index "eservices", ["owner_id", "owner_type"], name: "index_eservices_on_owner_id_and_owner_type", using: :btree

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faxes", force: true do |t|
    t.string   "number"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faxes", ["owner_id", "owner_type"], name: "index_faxes_on_owner_id_and_owner_type", using: :btree

  create_table "messages", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.text     "body"
    t.datetime "expire_at"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_users", force: true do |t|
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
    t.integer  "organization_id"
  end

  add_index "organization_users", ["email"], name: "index_organization_users_on_email", unique: true, using: :btree
  add_index "organization_users", ["reset_password_token"], name: "index_organization_users_on_reset_password_token", unique: true, using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.text     "address"
    t.text     "mission"
    t.text     "vision"
    t.text     "message"
    t.string   "logo"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: true do |t|
    t.string   "number"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["owner_id", "owner_type"], name: "index_phones_on_owner_id_and_owner_type", using: :btree

  create_table "polls", force: true do |t|
    t.text     "question"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsses", force: true do |t|
    t.integer  "organization_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_networks", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "social_networks", ["owner_id", "owner_type"], name: "index_social_networks_on_owner_id_and_owner_type", using: :btree

end
