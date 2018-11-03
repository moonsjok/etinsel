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

ActiveRecord::Schema.define(version: 2018_10_31_153103) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "annonces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "designation"
    t.string "categorie"
    t.string "sous_categorie"
    t.string "pays"
    t.string "ville"
    t.string "quartier"
    t.string "je_suis_le"
    t.string "tel"
    t.text "description", limit: 4294967295
    t.integer "prix"
    t.integer "commission_agence"
    t.string "minimum"
    t.string "condition"
    t.integer "nbr_menage"
    t.integer "superficie"
    t.integer "chambre"
    t.integer "salon"
    t.string "situe_dans"
    t.integer "cuisine"
    t.integer "douche"
    t.integer "wc"
    t.boolean "hopital", default: false
    t.boolean "marche", default: false
    t.boolean "ecole", default: false
    t.boolean "service_public", default: false
    t.boolean "aeroport", default: false
    t.boolean "supermarche", default: false
    t.boolean "hotel", default: false
    t.boolean "bar_restaurant", default: false
    t.boolean "mairie", default: false
    t.boolean "centre_de_loisir", default: false
    t.boolean "pharmacie", default: false
    t.boolean "pressing", default: false
    t.boolean "plage", default: false
    t.boolean "station_d_essence", default: false
    t.boolean "garage", default: false
    t.boolean "gare_routiere", default: false
    t.boolean "climatisation", default: false
    t.boolean "brasseur", default: false
    t.boolean "parking", default: false
    t.boolean "electricite", default: false
    t.boolean "eau", default: false
    t.boolean "voirie", default: false
    t.boolean "terrasse", default: false
    t.boolean "jardin", default: false
    t.boolean "meubles", default: false
    t.boolean "cours", default: false
    t.boolean "machine_a_laver", default: false
    t.boolean "chauffe_eau_toilette", default: false
    t.boolean "placards", default: false
    t.boolean "fibre_optique", default: false
    t.boolean "adsl", default: false
    t.boolean "reseaux_mobile", default: false
    t.boolean "sat", default: false
    t.boolean "wimax", default: false
    t.boolean "blr", default: false
    t.boolean "tv", default: false
    t.boolean "debarras", default: false
    t.boolean "valide", default: false
    t.boolean "signale", default: false
    t.boolean "miseenavant", default: false
    t.string "caution_electricite_eau"
    t.string "localisation_longitude"
    t.string "localisation_latitude"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "annoncesmiseenavants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "annonce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annonce_id"], name: "index_annoncesmiseenavants_on_annonce_id"
  end

  create_table "chats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
  end

  create_table "identities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "typeannonceur"
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "adress"
    t.string "zip"
    t.text "about"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "destinataire"
    t.text "message"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "content", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "role"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publictchats", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: ""
    t.string "username", default: ""
    t.string "phonenumber", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "online", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phonenumber"], name: "index_users_on_phonenumber", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "annoncesmiseenavants", "annonces"
end
