
require 'rubygems'
require 'bundler/setup'

require 'serverspec'
require 'pathname'

RSpec.configure do |config|
  set :backend, :exec
end
