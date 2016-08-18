class UserEntity < Grape::Entity
  expose :id, safe: true
  expose :name
end
