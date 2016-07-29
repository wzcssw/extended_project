class UserEntity < Grape::Entity
  expose :id, safe: true
  expose :name
  expose :birthday
  expose :phone
  expose :avatar
  expose :password
  expose :description
  expose :created_at
end
