module API
  module V1
    class Base < Grape::API
      helpers ApiHelper
      before do
        authen
        present :success, true
      end

      # 挂载API
      mount V1::UserApi
      mount V1::RolePrivilegeApi
    end
  end
end
