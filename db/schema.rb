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

ActiveRecord::Schema.define(version: 20140929000000) do

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["name"], name: "index_recipes_on_name"

  create_table "recipes_ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "item_id"
    t.float    "qty"
    t.string   "uom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes_ingredients", ["item_id"], name: "index_recipes_ingredients_on_item_id"
  add_index "recipes_ingredients", ["recipe_id"], name: "index_recipes_ingredients_on_recipe_id"

end
