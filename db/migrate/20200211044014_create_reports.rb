class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime "date"
      t.string  "comment"
      t.datetime "due_date"
      t.integer "user_id"
      t.string  "subjects"
      t.timestamps
    end
  end
end
