class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.date :start_date
      t.date :end_date
      t.datetime :class_time
      t.integer :slots
      t.string :modality
      t.string :custom_modality

      t.timestamps
    end
  end
end
