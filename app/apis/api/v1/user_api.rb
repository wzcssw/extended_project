module API
  module V1
    class UserApi < Grape::API
      prefix :users

      desc "用户列表"
      params do
        optional :page, type: Integer
        optional :limit, type: Integer
      end
      get :list do
        page = params[:page] || 1
        limit = params[:limit] || 20

        @users =  User.page(page).per(limit)
        present :users, @users ,with: UserEntity
        present :total_count, @users.total_count
        present :prev_page, @users.prev_page
        present :next_page, @users.next_page
        present :total_pages, @users.total_pages
        present :current_page, @users.current_page
      end

      desc "登录"
      params do
        requires :name, type: String
        requires :password, type: String
      end
      post :login do
        name = params[:name]
        password = params[:password]
        user = User.where(name: name,password: password).first
        if user
          access_token = AccessToken.create({id: user.id}) if user
          present :access_token, access_token
          present :user, user
        else
          error!({success: false,info: '用户不存在'}, 401)
        end
      end

      desc "用户信息"
      get :info do
        access_token = params[:access_token]
        uid = AccessToken.find(access_token)['id']
        user = User.find(uid)
        if user
          present :user, user
        else
          error!({success: false,info: '用户不存在'}, 401)
        end
      end
     end
  end
end
