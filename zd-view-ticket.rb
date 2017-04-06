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
puts "Showing: [##{ticket.id}] #{ticket.subject}"
ticket.comments.each do |comment|
  puts "### Update by #{comment.author_id} -- #{comment.created_at} -- Public? #{comment.public} ###"
  puts comment.plain_body
  puts
  puts "########"
end
