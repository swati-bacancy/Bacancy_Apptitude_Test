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

ActiveRecord::Schema.define(version: 20231123053725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.text "answer"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["student_id"], name: "index_answers_on_student_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "collages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.text "option_value"
    t.boolean "is_answer", default: false
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "preferred_positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tech", default: true
    t.boolean "non_tech", default: true
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_technical", default: false
  end

  create_table "questions_tests", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "test_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "student_id"
    t.integer "total_questions"
    t.integer "attempted_questions"
    t.integer "correct_answer"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roll_number"
    t.decimal "technical_marks"
    t.integer "total_marks"
    t.index ["student_id"], name: "index_results_on_student_id"
    t.index ["test_id"], name: "index_results_on_test_id"
  end

  create_table "student_answers", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "question_id"
    t.bigint "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "test_id"
    t.index ["option_id"], name: "index_student_answers_on_option_id"
    t.index ["question_id"], name: "index_student_answers_on_question_id"
    t.index ["student_id"], name: "index_student_answers_on_student_id"
    t.index ["test_id"], name: "index_student_answers_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "course"
    t.string "roll_number"
    t.string "collage_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "test_id"
    t.datetime "start_time"
    t.boolean "test_started", default: false
    t.bigint "preferred_position_id"
    t.index ["preferred_position_id"], name: "index_students_on_preferred_position_id"
    t.index ["test_id"], name: "index_students_on_test_id"
  end

  create_table "term_and_conditions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_questions", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_test_questions_on_question_id"
    t.index ["test_id"], name: "index_test_questions_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "total_time"
    t.boolean "is_technical", default: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "students"
  add_foreign_key "options", "questions"
  add_foreign_key "results", "students"
  add_foreign_key "results", "tests"
  add_foreign_key "student_answers", "options"
  add_foreign_key "student_answers", "questions"
  add_foreign_key "student_answers", "students"
  add_foreign_key "student_answers", "tests"
  add_foreign_key "students", "preferred_positions"
  add_foreign_key "students", "tests"
  add_foreign_key "test_questions", "questions"
  add_foreign_key "test_questions", "tests"
end
