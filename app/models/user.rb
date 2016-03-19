class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :family_relationships
  has_many :carepro_relationships
end

