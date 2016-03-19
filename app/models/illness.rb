class Illness < ActiveRecord::Base
    validates :name, presence: true
    has_many :patient_illnesses
end
