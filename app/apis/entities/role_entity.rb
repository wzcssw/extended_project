class RoleEntity < Grape::Entity
  expose :id, safe: true
  expose :name
  expose :remark
end
