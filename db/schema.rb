# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091012093221) do

  create_table "base_active_histories", :force => true do |t|
    t.date     "history_day"
    t.integer  "before_days"
    t.integer  "user_count"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_carriers", :force => true do |t|
    t.string   "name",       :limit => 256, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_errors", :force => true do |t|
    t.string   "error_code", :null => false
    t.text     "message",    :null => false
    t.text     "coping",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_favorites", :force => true do |t|
    t.integer  "base_user_id", :null => false
    t.integer  "favorite_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_friends", :force => true do |t|
    t.integer  "base_user_id", :null => false
    t.integer  "friend_id",    :null => false
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_inquires", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "referer"
    t.string   "mail_address"
    t.integer  "base_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_mail_dispatch_infos", :force => true do |t|
    t.string   "mail_address"
    t.string   "model_name"
    t.string   "method_name"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "base_user_id"
  end

  create_table "base_mail_template_kinds", :force => true do |t|
    t.string   "action",      :null => false
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_mail_templates", :force => true do |t|
    t.integer  "base_mail_template_kind_id", :null => false
    t.string   "content_type",               :null => false
    t.string   "subject",                    :null => false
    t.text     "body",                       :null => false
    t.boolean  "active_flag"
    t.boolean  "footer_flag"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_type",                :null => false
  end

  create_table "base_menus", :force => true do |t|
    t.integer  "base_user_id",                          :null => false
    t.integer  "base_menu_master_id",                   :null => false
    t.integer  "num",                                   :null => false
    t.boolean  "show_flag",           :default => true, :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_ng_words", :force => true do |t|
    t.string   "word"
    t.boolean  "active_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_notices", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "base_profiles", :force => true do |t|
    t.integer  "base_user_id",                             :null => false
    t.string   "name",                      :limit => 100
    t.integer  "name_public_level"
    t.string   "kana_name",                 :limit => 100
    t.integer  "kana_name_public_level"
    t.text     "introduction"
    t.integer  "introduction_public_level"
    t.integer  "sex"
    t.integer  "sex_public_level"
    t.integer  "civil_status"
    t.integer  "civil_status_public_level"
    t.date     "birthday"
    t.integer  "birthday_public_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "image"
    t.string   "area"
    t.integer  "area_public_level"
  end

  add_index "base_profiles", ["base_user_id"], :name => "index_base_profiles_on_base_user_id"

  create_table "base_user_file_histories", :force => true do |t|
    t.integer  "base_user_id", :null => false
    t.string   "file_name",    :null => false
    t.datetime "complated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_user_roles", :force => true do |t|
    t.integer  "base_user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "base_user_roles", ["base_user_id"], :name => "index_base_user_roles_on_base_user_id"

  create_table "base_users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",           :limit => 40
    t.string   "salt",                       :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "deleted_at"
    t.integer  "status"
    t.string   "activation_code"
    t.string   "crypted_uid"
    t.datetime "joined_at"
    t.datetime "quitted_at"
    t.string   "new_email"
    t.boolean  "receive_system_mail_flag"
    t.boolean  "receive_mail_magazine_flag"
    t.integer  "message_accept_level",                     :default => 2,    :null => false
    t.boolean  "footmark_flag",                            :default => true, :null => false
    t.integer  "base_carrier_id"
    t.string   "device_name"
    t.string   "name"
  end

  add_index "base_users", ["activation_code"], :name => "index_base_users_on_activation_code"
  add_index "base_users", ["crypted_uid"], :name => "index_base_users_on_uid"
  add_index "base_users", ["email"], :name => "index_base_users_on_email"
  add_index "base_users", ["joined_at"], :name => "index_base_users_on_joined_at"
  add_index "base_users", ["status"], :name => "index_base_users_on_status"

  create_table "bdrb_job_queues", :force => true do |t|
    t.binary   "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "mixi_active_histories", :force => true do |t|
    t.date     "history_day"
    t.integer  "before_days"
    t.integer  "user_count"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_activities", :force => true do |t|
    t.integer  "create_mixi_user_id",  :null => false
    t.integer  "receipt_mixi_user_id", :null => false
    t.text     "title"
    t.text     "body"
    t.string   "priority"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_app_invite_summaries", :force => true do |t|
    t.integer  "summary_type",             :null => false
    t.datetime "start_at",                 :null => false
    t.datetime "end_at",                   :null => false
    t.integer  "registed_mixi_user_count", :null => false
    t.float    "broadening_coefficient",   :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_app_invites", :force => true do |t|
    t.integer  "mixi_user_id",    :null => false
    t.integer  "invitee_user_id", :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invite_status"
  end

  create_table "mixi_friends", :force => true do |t|
    t.integer  "mixi_user_id", :null => false
    t.integer  "friend_id",    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mixi_friends", ["mixi_user_id", "friend_id"], :name => "index_mixi_friends_on_mixi_user_id_and_friend_id", :unique => true

  create_table "mixi_inflow_masters", :force => true do |t|
    t.string   "route_name", :null => false
    t.string   "route_key",  :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_inflow_summaries", :force => true do |t|
    t.integer  "summary_type",             :null => false
    t.datetime "start_at",                 :null => false
    t.datetime "end_at",                   :null => false
    t.integer  "inflow_mixi_user_count",   :null => false
    t.integer  "registed_mixi_user_count", :null => false
    t.integer  "mixi_inflow_master_id",    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_inflows", :force => true do |t|
    t.integer  "mixi_inflow_master_id", :null => false
    t.text     "referrer"
    t.string   "tracking_key"
    t.string   "app_name"
    t.integer  "mixi_user_id"
    t.datetime "registed_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_tokens", :force => true do |t|
    t.string   "token"
    t.boolean  "use_flag"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixi_users", :force => true do |t|
    t.string   "mixi_id",       :null => false
    t.integer  "base_user_id"
    t.string   "nickname"
    t.string   "profile_url"
    t.string   "thumbnail_url"
    t.integer  "status"
    t.datetime "joined_at"
    t.datetime "quitted_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mixi_users", ["mixi_id"], :name => "index_mixi_users_on_mixi_id", :unique => true

  create_table "mng_user_action_histories", :force => true do |t|
    t.integer  "base_user_id", :null => false
    t.text     "user_action",  :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mng_user_action_history_archives", :force => true do |t|
    t.string   "filename",       :null => false
    t.integer  "filesize",       :null => false
    t.datetime "start_datetime", :null => false
    t.datetime "end_datetime",   :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
