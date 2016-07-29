class AccessToken
  def AccessToken.find(id)
    @redis = Redis.new(:host => Settings.redis.host, port: Settings.redis.port, :db => Settings.redis.db)
    @redis.hgetall("extended_project:access_token:#{id}")
  end
  def AccessToken.create(obj)
    access_token_str = SecureRandom.hex(6)
    @redis = Redis.new(:host => Settings.redis.host, port: Settings.redis.port, :db => Settings.redis.db)
    @redis.mapped_hmset("extended_project:access_token:#{access_token_str}",obj)
    @redis.expire("extended_project:access_token:#{access_token_str}" ,Settings.redis.access_token_expire)
    access_token_str
  end

  def AccessToken.auth access_token
    {} != AccessToken.find(access_token)
  end
end
