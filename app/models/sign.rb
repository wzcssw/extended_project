class Sign
  def Sign.auth(param)
    timestemp = param['timestemp'].to_s
    app_token = param['app_token'].to_s
    access_token = param['access_token'].to_s
    sign = param['sign'].to_s
    sign == Digest::MD5.hexdigest("#{access_token}#{app_token}#{timestemp}")
  end
end
