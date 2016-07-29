class Apptoken < ActiveRecord::Base
  # 生成令牌
  def Apptoken.generate
    Apptoken.create token: SecureRandom.hex(6)
  end
  
  # 验证
  def Apptoken.auth param
    nil != Apptoken.where(token: param).first
  end
end
