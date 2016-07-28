module API
  class Base < Grape::API
    content_type :json, 'application/json'
    format :json
    default_format :json

    mount V1::Base => :v1
  end
end
