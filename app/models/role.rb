class Role < ActiveRecord::Base
  has_one :user, foreign_key: "role_id"

  has_many :role_privileges
  has_many :privileges, through: :role_privileges

  def can? param # 判断是否有param权限
    result = false
    self.privileges.each do |p|
      result = true if p.name == param
    end
    result
  end
end
