class Privilege < ActiveRecord::Base
  has_many :role_privileges
  has_many :roles, through: :role_privileges
end
