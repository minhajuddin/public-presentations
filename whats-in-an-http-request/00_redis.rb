# frozen_string_literal: true

require 'redis'

redis = Redis.new

puts redis.keys 'FOOBAR'
