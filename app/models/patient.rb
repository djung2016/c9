class Patient < ActiveRecord::Base
    validates :name, presence: true
    has_many :users
    has_many :calendar_events
    has_many :family_relationships
    has_many :carepro_relationships
    has_secure_password
end
