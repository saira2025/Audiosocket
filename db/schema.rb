# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_921_070_016) do # rubocop:disable Metrics/BlockLength
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'auditions', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'artist_name'
    t.integer 'genre'
    t.string 'about_us'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'additional_info'
    t.integer 'status', default: 0
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_auditions_on_user_id'
  end

  create_table 'ckeditor_assets', force: :cascade do |t|
    t.string 'data_file_name', null: false
    t.string 'data_content_type'
    t.integer 'data_file_size'
    t.string 'data_fingerprint'
    t.string 'type', limit: 30
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['type'], name: 'index_ckeditor_assets_on_type'
  end

  create_table 'songs', force: :cascade do |t|
    t.string 'link'
    t.bigint 'audition_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['audition_id'], name: 'index_songs_on_audition_id'
  end

  create_table 'users', force: :cascade do |t|
    t.integer 'role', default: 0
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'country'
    t.string 'bio'
    t.string 'social_link', default: [], array: true
    t.string 'website_link'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'auditions', 'users'
  add_foreign_key 'songs', 'auditions'
end
