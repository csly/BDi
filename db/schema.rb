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

ActiveRecord::Schema.define(version: 20160121133615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "article_artists", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image"
    t.text     "youtube"
    t.integer  "status",             default: 0, null: false
    t.datetime "scheduled_at"
  end

  add_index "articles", ["status"], name: "index_articles_on_status", using: :btree

  create_table "artist_formats", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_genres", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_releases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_types", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "biog"
    t.string   "links"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "twitter"
    t.string   "facebook"
    t.boolean  "composer"
    t.boolean  "songwriter"
    t.string   "image"
    t.string   "photo"
    t.string   "biography"
    t.boolean  "artisttag"
    t.boolean  "producer"
  end

  create_table "audios", force: :cascade do |t|
    t.string   "name"
    t.string   "track"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "audios", ["artist_id"], name: "index_audios_on_artist_id", using: :btree

  create_table "award_artists", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "award_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "image"
    t.string   "youtube"
  end

  create_table "b_di_productions", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.string   "links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "composer_tracks", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "composer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "composers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrumentations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "moods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "body"
  end

  create_table "press_artists", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "press_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presses", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "image"
    t.string   "youtube"
    t.string   "link"
    t.string   "download"
  end

  create_table "production_companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "production_company_id"
  end

  add_index "productions", ["production_company_id"], name: "index_productions_on_production_company_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_artists", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_formats", force: :cascade do |t|
    t.integer  "release_id"
    t.integer  "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_genres", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_medias", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "release_id"
    t.integer  "media_id"
  end

  create_table "release_productions", force: :cascade do |t|
    t.integer  "production_id"
    t.integer  "release_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.date     "date"
    t.string   "links"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "production"
    t.string   "amazon"
    t.string   "itunes"
    t.string   "image"
    t.string   "highest_chart"
    t.integer  "chart_position"
    t.string   "featured_text"
    t.string   "media"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.text     "biog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
    t.string   "email"
    t.string   "phone"
    t.string   "image"
    t.string   "photo"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "track_instrumentations", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "instrumentation_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "track_moods", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "mood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "track_productions", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "production_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "track_styles", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.string   "catalogue"
    t.string   "oldtitle"
    t.string   "origin"
    t.string   "track_composer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "publisher_id"
    t.string   "url"
  end

  create_table "types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "user_tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "track_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.boolean  "admin"
    t.boolean  "client"
    t.integer  "production_company_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["production_company_id"], name: "index_users_on_production_company_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
