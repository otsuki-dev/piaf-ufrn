class AddTermsAcceptedToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :terms_accepted, :boolean
  end
end
