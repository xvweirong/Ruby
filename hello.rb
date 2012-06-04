require 'rubygems'
require 'sinatra'

$hits = 0

get '/' do
  $hits = $redis.incr('hits')
  "Hello Cloud Foundry - #{$hits}"
end