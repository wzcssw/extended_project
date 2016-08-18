module API
  module V1
    class UserApi < Grape::API
      prefix :users

      desc "用户列表"
      params do
        optional :page, type: Integer
        optional :limit, type: Integer
        optional :q, type: String
      end
      get :list do
        page = params[:page] || 1
        limit = params[:limit] || 20
        q = params[:q] || ''

        @users =  User.page(page).per(limit)
        @users =  User.where(name: q).page(page).per(limit) if q.present?

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
          present :user, user ,with: UserEntity
        else
          error!({success: false,info: '用户不存在'}, 200)
        end
      end

      desc "用户信息"
      get :info do
        access_token = params[:access_token]
        uid = AccessToken.find(access_token)['id']
        user = User.find(uid)
        if user
          present :user, user ,with: UserEntity
        else
          error!({success: false,info: '用户不存在'}, 200)
        end
      end

      desc "删除用户信息"
      delete :delete do
        id = params[:id]
        user = User.find(id)
        if user
          user.delete
        else
          error!({success: false,info: '用户不存在'}, 200)
        end
      end

      desc "更新用户信息"
      put :update do
        user_param = JSON.parse params[:user]
        user = User.find(user_param['id'])
        if user
          user.update_attributes user_param
        else
          error!({success: false,info: '用户不存在'}, 200)
        end
      end

     end
  end
end
