# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_903_192_858) do
  create_table 'measurements', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'category'
    t.integer 'total'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_measurements_on_user_id'
  end

  create_table 'product_measurements', force: :cascade do |t|
    t.integer 'measurement_id', null: false
    t.integer 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['measurement_id'], name: 'index_product_measurements_on_measurement_id'
    t.index ['product_id'], name: 'index_product_measurements_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title'
    t.decimal 'price'
    t.boolean 'published'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_products_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'measurements', 'users'
  add_foreign_key 'product_measurements', 'measurements'
  add_foreign_key 'product_measurements', 'products'
  add_foreign_key 'products', 'users'
end
