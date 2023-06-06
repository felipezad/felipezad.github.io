require 'slack-ruby-client'

# Set up a Slack API client with your bot token
Slack.configure do |config|
  config.token = 'xoxb-4780569825223-5373365169190-NUaEoHmGtiWHvX8HXKA8DIX4'
end
client = Slack::Web::Client.new

# Search for a user by email address
email = 'felipe.zadinello@sumup.com'
response = client.users_lookupByEmail(email: email)

# puts response
puts response.user.id

# Get the user ID of the user you want to send a message to
user_id = client.users_info(user: response.user.id).user.id

# # Send a message to the user
client.chat_postMessage(channel: user_id, text: 'Hello, World!')
