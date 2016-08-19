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

      desc "权限列表"
      params do
        optional :page, type: Integer
        optional :limit, type: Integer
        optional :q, type: String
        optional :role_id, type: Integer
      end
      get :privilege_list do
        page = params[:page] || 1
        limit = params[:limit] || 20
        q = params[:q] || ''
        role_id = params[:role_id]

        @privileges =  Privilege.page(page).per(limit) if (role_id.blank? && q.blank?)
        @privileges =  Privilege.joins(:roles).where("role_id=?",role_id).page(page).per(limit) if role_id.present?
        @privileges =  Privilege.where(name: q).page(page).per(limit) if q.present?

        present :privilege, @privileges
        present :total_count, @privileges.total_count
        present :prev_page, @privileges.prev_page
        present :next_page, @privileges.next_page
        present :total_pages, @privileges.total_pages
        present :current_page, @privileges.current_page
      end

     end
  end
end
