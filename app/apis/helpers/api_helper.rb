module ApiHelper

  def authen
    app_token = params[:app_token]
    access_token = params[:access_token]
    timestemp = params[:timestemp]
    return error!({success: false,info: 'app_token 错误'}, 401) unless Apptoken.auth app_token
    unless is_login_request?
      return error!({success: false,info: '时间戳 错误'}, 401) unless Timestemp.auth timestemp
      return error!({success: false,info: 'access_token 错误'}, 401) unless AccessToken.auth access_token
      return error!({success: false,info: 'sign 错误'}, 401) unless Sign.auth params
    end
  end

  # 判断是否是登录请求
  def is_login_request?
    '/api/v1/users/login' == request.path
  end
end
