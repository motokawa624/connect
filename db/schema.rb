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

ActiveRecord::Schema.define(version: 20_200_616_070_408) do
  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.string 'author_type'
    t.integer 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'belongs', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'team_id'
    t.boolean 'belong', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['team_id'], name: 'index_belongs_on_team_id'
    t.index ['user_id'], name: 'index_belongs_on_user_id'
  end

  create_table 'chats', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.text 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_chats_on_room_id'
    t.index ['user_id'], name: 'index_chats_on_user_id'
  end

  create_table 'contacts', force: :cascade do |t|
    t.string 'email'
    t.text 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'team_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['team_id'], name: 'index_favorites_on_team_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'post_comments', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'team_id'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['team_id'], name: 'index_post_comments_on_team_id'
    t.index ['user_id'], name: 'index_post_comments_on_user_id'
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'taggings', force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'taggings_taggable_context_idx'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.boolean 'is_status', default: false
    t.integer 'place'
    t.text 'introduction'
    t.string 'team_image_id'
    t.text 'url'
    t.integer 'owner_user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_rooms', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_user_rooms_on_room_id'
    t.index ['user_id'], name: 'index_user_rooms_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name'
    t.integer 'place'
    t.text 'introduction'
    t.string 'profile_image_id'
    t.text 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider', default: ''
    t.string 'uid', default: ''
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
