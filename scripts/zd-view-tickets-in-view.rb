#!/usr/bin/ruby

require 'zendesk_api'
require './config.rb'

client = ZendeskAPI::Client.new do |config|
  config.url = "https://#{ENV['zd_url']}/api/v2"
  config.username = ENV['zd_user']
  config.token = ENV['zd_token']

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true
end

users = Hash.new

client.views.find(id: ARGV[0]).tickets.each do |ticket|
  unless users.has_key?(ticket.requester_id)
    users[ticket.requester_id] = client.users.find!(:id => ticket.requester_id)
  end
  puts "#{ticket.id} #{'%-50.50s' % ticket.subject} #{'%-10.10s' % users[ticket.requester_id].email} #{ticket.updated_at}"
end
