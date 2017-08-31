#!/usr/bin/ruby

require 'zendesk_api'
require './config.rb'

tickets = Array.new

client = ZendeskAPI::Client.new do |config|
  config.url = "https://#{ENV['zd_url']}/api/v2"
  config.username = ENV['zd_user']
  config.token = ENV['zd_token']

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true
end


client.search(:query => 'type:ticket').all do |object|
  next unless object['result_type'].to_s == 'ticket'
  tickets << object.id
end

range = (342002..tickets.max).to_a

deleted = range - tickets

deleted.each do |ticket|
  puts ticket
end
