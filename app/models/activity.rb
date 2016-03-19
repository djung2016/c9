class Activity < ActiveRecord::Base
    validates :name, presence: true
    has_many :patient_activities

end
