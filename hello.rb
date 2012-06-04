require 'rubygems'
require 'sinatra'

$hits = 0

get '/' do
  $hits = $hits + 1
  "Hello Cloud Foundry - #{$hits}"
end