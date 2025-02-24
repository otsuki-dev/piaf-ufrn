class ModifyCourses < ActiveRecord::Migration[8.0]
  def change
    # Alterar start_date e end_date para datetime
    change_column :courses, :start_date, :datetime
    change_column :courses, :end_date, :datetime
    
    # Alterar class_time para string
    change_column :courses, :class_time, :string
  end
end
