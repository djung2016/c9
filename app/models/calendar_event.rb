class CalendarEvent < ActiveRecord::Base
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    belongs_to :patient
    belongs_to :user
    belongs_to :activity
end
