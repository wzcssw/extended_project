module API
  module V1
    class RolePrivilegeApi < Grape::API
      prefix :role_privileges

      desc "角色列表"
      params do
        optional :page, type: Integer
        optional :limit, type: Integer
        optional :q, type: String
      end
      get :role_list do
        page = params[:page] || 1
        limit = params[:limit] || 20
        q = params[:q] || ''

        @roles =  Role.page(page).per(limit)
        @roles =  Role.where(name: q).page(page).per(limit) if q.present?

        present :roles, @roles ,with: RoleEntity
        present :total_count, @roles.total_count
        present :prev_page, @roles.prev_page
        present :next_page, @roles.next_page
        present :total_pages, @roles.total_pages
        present :current_page, @roles.current_page
      end

     end
  end
end
