class Test
  def Test.go
    app_token = Apptoken.first.token
    access_token = AccessToken.create({id: 1})
    timestemp = Time.now.to_i.to_s
    sign = Digest::MD5.hexdigest("#{access_token}#{app_token}#{timestemp}")
    puts "[POST]"
    puts "http://localhost:3000/api/v1/users/login?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}&name=cheng&password=123123"
    puts "[GET]"
    puts "http://localhost:3000/api/v1/users/list?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}"
    puts "[GET]"
    puts "http://localhost:3000/api/v1/users/info?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}"
    puts ""
    puts "[DELETE]"
    puts "http://localhost:3000/api/v1/users/delete?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}&id="
    puts "[GET]"
    puts "http://localhost:3000/api/v1/role_privileges/role_list?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}"
    puts "[GET]"
    puts "http://localhost:3000/api/v1/role_privileges/privilege_list?app_token=#{app_token}&access_token=#{access_token}&timestemp=#{timestemp}&sign=#{sign}"
  end
end
