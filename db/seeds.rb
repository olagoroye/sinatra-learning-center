

# create_table "reports", force: :cascade do |t|
#     t.datetime "date"
#     t.string   "comment"
#     t.datetime "due_date"
#     t.integer  "user_id"
#     t.string   "subjects"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "name"
#     t.string   "email"
#     t.string   "password_digest"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end



user_1 = User.create(name: "Tiara", email: "tiara@gmail.com", password: "password")
user_2 = User.create(name: "Sola", email: "sola@gmail.com", password: "password")

  
  
report_1 = Report.create(date: Date.today, comment: "very good performance", user_id: 1, due_date: Date.today.next, subjects: "Reading")

report_2 = Report.create(date: Date.today,comment: "Average performance", user_id: 1, due_date: Date.today.next, subjects: "Math")

