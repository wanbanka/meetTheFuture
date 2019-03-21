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

ActiveRecord::Schema.define(version: 2019_02_26_200635) do

  create_table "decisions", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.integer "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "first_decision"
    t.integer "futur_id"
    t.string "second_futur"
    t.index ["futur_id"], name: "index_decisions_on_futur_id"
    t.index ["theme_id"], name: "index_decisions_on_theme_id"
  end

  create_table "futurs", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "texte_depart"
    t.integer "futur_id"
  end

  create_table "user_decisions", force: :cascade do |t|
    t.integer "decision_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_id"], name: "index_user_decisions_on_decision_id"
    t.index ["user_id"], name: "index_user_decisions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "pseudo", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
