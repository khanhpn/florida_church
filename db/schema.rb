# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_12_065828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "adoration_times", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_adoration_times_on_user_id"
  end

  create_table "adults", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name_link"
    t.index ["user_id"], name: "index_adults_on_user_id"
  end

  create_table "altar_servers", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_altar_servers_on_display_order"
    t.index ["user_id"], name: "index_altar_servers_on_user_id"
  end

  create_table "altar_societies", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_altar_societies_on_display_order"
    t.index ["user_id"], name: "index_altar_societies_on_user_id"
  end

  create_table "anointing_thesicks", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_anointing_thesicks_on_display_order"
    t.index ["user_id"], name: "index_anointing_thesicks_on_user_id"
  end

  create_table "art_craft_groups", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_art_craft_groups_on_user_id"
  end

  create_table "baptisms", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_baptisms_on_display_order"
    t.index ["user_id"], name: "index_baptisms_on_user_id"
  end

  create_table "bulletins", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image_content"
    t.index ["user_id"], name: "index_bulletins_on_user_id"
  end

  create_table "category_galleries", force: :cascade do |t|
    t.string "name"
    t.boolean "display", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_category_galleries_on_user_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name_link"
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "children_youths", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_children_youths_on_user_id"
  end

  create_table "childrens_liturgies", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_childrens_liturgies_on_display_order"
    t.index ["user_id"], name: "index_childrens_liturgies_on_user_id"
  end

  create_table "clergies", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "image_user"
    t.boolean "display"
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_clergies_on_display_order"
    t.index ["user_id"], name: "index_clergies_on_user_id"
  end

  create_table "confirmations", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_confirmations_on_display_order"
    t.index ["user_id"], name: "index_confirmations_on_user_id"
  end

  create_table "confression_times", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_confression_times_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.text "google_map"
    t.text "office_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "councils", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "image_user"
    t.boolean "display"
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_councils_on_display_order"
    t.index ["user_id"], name: "index_councils_on_user_id"
  end

  create_table "deacons", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "image_user"
    t.boolean "display"
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_deacons_on_display_order"
    t.index ["user_id"], name: "index_deacons_on_user_id"
  end

  create_table "ecuharistic_ministries", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_ecuharistic_ministries_on_display_order"
    t.index ["user_id"], name: "index_ecuharistic_ministries_on_user_id"
  end

  create_table "environment_churches", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display"
    t.bigint "user_id"
    t.integer "display_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_environment_churches_on_display_order"
    t.index ["user_id"], name: "index_environment_churches_on_user_id"
  end

  create_table "eucharistic_saint_videos", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_eucharistic_saint_videos_on_user_id"
  end

  create_table "eucharists", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_eucharists_on_display_order"
    t.index ["user_id"], name: "index_eucharists_on_user_id"
  end

  create_table "faith_formations", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_faith_formations_on_user_id"
  end

  create_table "food_baskets", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_food_baskets_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "funerals", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_funerals_on_display_order"
    t.index ["user_id"], name: "index_funerals_on_user_id"
  end

  create_table "gallery_images", force: :cascade do |t|
    t.string "name"
    t.boolean "display"
    t.integer "display_order"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gallery_images_on_user_id"
  end

  create_table "geographies", force: :cascade do |t|
    t.string "lat"
    t.string "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "haitian_prayers", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_haitian_prayers_on_user_id"
  end

  create_table "history_churches", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display"
    t.bigint "user_id"
    t.integer "display_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_history_churches_on_display_order"
    t.index ["user_id"], name: "index_history_churches_on_user_id"
  end

  create_table "holyorders", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_holyorders_on_display_order"
    t.index ["user_id"], name: "index_holyorders_on_user_id"
  end

  create_table "hospital_visits", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hospital_visits_on_user_id"
  end

  create_table "introductions", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "youtube_url"
    t.text "address"
    t.string "phone"
    t.string "email"
    t.string "copywrite"
    t.text "office_hour"
    t.string "flict_channel"
    t.string "youtube_channel_url"
    t.string "facebook_channel"
    t.text "logo_icon"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "header_logo_icon"
    t.index ["user_id"], name: "index_introductions_on_user_id"
  end

  create_table "knight_columbs", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_knight_columbs_on_user_id"
  end

  create_table "ladies_saint_johns", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ladies_saint_johns_on_user_id"
  end

  create_table "lectors", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_lectors_on_display_order"
    t.index ["user_id"], name: "index_lectors_on_user_id"
  end

  create_table "linked_logos", force: :cascade do |t|
    t.string "name"
    t.text "logo_linked"
    t.text "logo_url"
    t.boolean "display"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_linked_logos_on_user_id"
  end

  create_table "marriages", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_marriages_on_display_order"
    t.index ["user_id"], name: "index_marriages_on_user_id"
  end

  create_table "mass_times", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mass_times_on_user_id"
  end

  create_table "masses", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "file_attached"
    t.boolean "ticked"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_masses_on_user_id"
  end

  create_table "memorial_books", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_memorial_books_on_user_id"
  end

  create_table "music_ministries", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_music_ministries_on_display_order"
    t.index ["user_id"], name: "index_music_ministries_on_user_id"
  end

  create_table "parish_events", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parish_events_on_user_id"
  end

  create_table "photo_galleries", force: :cascade do |t|
    t.string "name"
    t.text "file_image"
    t.boolean "display", default: false
    t.boolean "is_main_image", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_gallery_id"
  end

  create_table "pray_gardens", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "name_link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pray_gardens_on_user_id"
  end

  create_table "prayer_groups", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_prayer_groups_on_display_order"
    t.index ["user_id"], name: "index_prayer_groups_on_user_id"
  end

  create_table "reconciliations", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_reconciliations_on_display_order"
    t.index ["user_id"], name: "index_reconciliations_on_user_id"
  end

  create_table "respect_lives", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_respect_lives_on_user_id"
  end

  create_table "sacramentals", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_sacramentals_on_display_order"
    t.index ["user_id"], name: "index_sacramentals_on_user_id"
  end

  create_table "special_notes", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_special_notes_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "image_user"
    t.boolean "display"
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_staffs_on_display_order"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "teaching_masses", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_teaching_masses_on_display_order"
    t.index ["user_id"], name: "index_teaching_masses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "year_old"
    t.boolean "sex", default: false
    t.integer "country"
    t.text "address"
    t.integer "user_type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "logo_icon"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "ushers_hospitalities", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.boolean "display", default: false
    t.integer "display_order"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.index ["display_order"], name: "index_ushers_hospitalities_on_display_order"
    t.index ["user_id"], name: "index_ushers_hospitalities_on_user_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_article", default: false
    t.text "file_image"
    t.text "file_pdf"
    t.text "name_link"
    t.boolean "display", default: false
    t.string "slug"
    t.index ["slug"], name: "index_welcomes_on_slug", unique: true
  end

  create_table "women_graces", force: :cascade do |t|
    t.string "name"
    t.string "name_link"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_women_graces_on_user_id"
  end

  create_table "worships", force: :cascade do |t|
    t.string "title"
    t.string "worshipable_type"
    t.bigint "worshipable_id"
    t.text "worship_upload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["worshipable_type", "worshipable_id"], name: "index_worships_on_worshipable"
  end

  create_table "youths", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "file_image"
    t.text "file_pdf"
    t.string "link"
    t.boolean "display", default: false
    t.boolean "is_main_article", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name_link"
    t.index ["user_id"], name: "index_youths_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
