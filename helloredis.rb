require 'rubygems'
require 'sinatra'
require 'redis'
require 'json'

configure do
    services = JSON.parse(ENV['VCAP_SERVICES'])
    redis_key = services.keys.select { |svc| svc =~ /redis/i }.first
    redis = services[redis_key].first['credentials']
    redis_conf = {:host => redis['hostname'], :port => redis['port'], :password => redis['password']}
    @@redis = Redis.new redis_conf
end

$hits = 0

get '/' do
  $hits = @@redis.incr('hits')
  "Hello Cloud Foundry - #{$hits}"
end