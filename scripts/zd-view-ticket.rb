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

ticket = ZendeskAPI::Ticket.find(client, :id => ARGV[0])
users[ticket.assignee_id] = client.users.find!(:id => ticket.assignee_id)
puts "Showing: [##{ticket.id}] #{ticket.subject} | Status: #{ticket.status} | Assigned to #{users[ticket.assignee_id].name}"
ticket.comments.each do |comment|
  unless users.has_key?(comment.author_id)
    users[comment.author_id] = client.users.find!(:id => comment.author_id)
  end
  if comment.public == true
    visibility='Public'
  else
    visibility='Internal'
  end
  puts
  puts "### #{visibility} update by #{users[comment.author_id].name}|#{users[comment.author_id].email} -- #{comment.created_at} ###"
  puts comment.plain_body
  puts
  puts "########"
end
