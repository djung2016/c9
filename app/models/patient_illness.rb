class PatientIllness < ActiveRecord::Base
    
    belongs_to :illness
    belongs_to :patient
end