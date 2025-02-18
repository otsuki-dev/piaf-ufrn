class Course < ApplicationRecord
    belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments

    validates :start_date, :end_date, :class_time, :slots, :modality, presence: true
end
