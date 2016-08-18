class User < ActiveRecord::Base
  belongs_to :role

  def can? param # 判断是否有param权限
    self.role.can? param
  end
end
