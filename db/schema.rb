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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111104133207) do

  create_table "bug_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bug_comments", :force => true do |t|
    t.integer  "bug_post_id", :null => false
    t.text     "body",        :null => false
    t.integer  "user_id",     :null => false
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bug_comments", ["bug_post_id"], :name => "index_bug_comments_on_bug_post_id"
  add_index "bug_comments", ["user_id"], :name => "index_bug_comments_on_user_id"

  create_table "bug_lists", :force => true do |t|
    t.string   "title",                                               :null => false
    t.integer  "project_id",                                          :null => false
    t.text     "description"
    t.string   "status",          :limit => 20, :default => "Active", :null => false
    t.integer  "user_id"
    t.integer  "bug_posts_count",               :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bug_lists", ["project_id"], :name => "index_bug_lists_on_project_id"
  add_index "bug_lists", ["user_id"], :name => "index_bug_lists_on_user_id"

  create_table "bug_posts", :force => true do |t|
    t.string   "title",                                                   :null => false
    t.text     "body",                                                    :null => false
    t.string   "status",                        :default => "For Fixing", :null => false
    t.string   "img_url"
    t.integer  "bug_list_id",                                             :null => false
    t.integer  "posted_by_id",                                            :null => false
    t.integer  "posted_for_id",                                           :null => false
    t.string   "priority",        :limit => 20, :default => "Normal",     :null => false
    t.integer  "no_of_fixes",                   :default => 0,            :null => false
    t.integer  "no_of_tests",                   :default => 1,            :null => false
    t.datetime "closed_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bug_category_id"
  end

  add_index "bug_posts", ["bug_list_id"], :name => "index_bug_posts_on_bug_list_id"
  add_index "bug_posts", ["posted_by_id"], :name => "index_bug_posts_on_posted_by_id"
  add_index "bug_posts", ["posted_for_id"], :name => "index_bug_posts_on_posted_for_id"

  create_table "projects", :force => true do |t|
    t.string   "name",                                            :null => false
    t.date     "start_date",                                      :null => false
    t.date     "end_date"
    t.text     "description"
    t.string   "status",      :limit => 20, :default => "Active", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_tasks", :id => false, :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "task_id",    :null => false
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "user_id",    :null => false
  end

  create_table "rights", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "description"
    t.boolean  "is_read",       :default => false
    t.boolean  "is_delete",     :default => false
    t.boolean  "is_update",     :default => false
    t.boolean  "is_create",     :default => false
    t.boolean  "is_executable", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", :id => false, :force => true do |t|
    t.integer "right_id", :null => false
    t.integer "role_id",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_ledgers", :force => true do |t|
    t.integer  "project_id",                                         :null => false
    t.integer  "task_id",                                            :null => false
    t.datetime "start_datetime",                                     :null => false
    t.datetime "end_datetime"
    t.integer  "user_id",                                            :null => false
    t.float    "duration"
    t.text     "description"
    t.string   "status",         :limit => 20, :default => "Active", :null => false
    t.boolean  "is_manual",                    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_ledgers", ["project_id"], :name => "index_task_ledgers_on_project_id"
  add_index "task_ledgers", ["task_id"], :name => "index_task_ledgers_on_task_id"
  add_index "task_ledgers", ["user_id"], :name => "index_task_ledgers_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name",                         :null => false
    t.string   "password",                          :null => false
    t.integer  "role_id"
    t.string   "screen_name",                       :null => false
    t.string   "email"
    t.integer  "bug_posts_count", :default => 0
    t.boolean  "is_notify",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
