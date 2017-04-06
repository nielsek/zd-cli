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

ticket = ZendeskAPI::Ticket.find(client, :id => ARGV[0])
ticket.assignee_id = client.users.search(:query => ARGV[1])[0].id
puts ticket.save!
