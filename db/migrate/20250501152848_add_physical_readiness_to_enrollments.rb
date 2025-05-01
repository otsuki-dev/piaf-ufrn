class AddPhysicalReadinessToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :heart_problem, :boolean
    add_column :enrollments, :chest_pain, :boolean
    add_column :enrollments, :recent_chest_pain, :boolean
    add_column :enrollments, :dizziness, :boolean
    add_column :enrollments, :bone_problem, :boolean
    add_column :enrollments, :blood_pressure_meds, :boolean
    add_column :enrollments, :other_reasons, :boolean
    add_column :enrollments, :physical_activity_responsibility, :boolean
  end
end
