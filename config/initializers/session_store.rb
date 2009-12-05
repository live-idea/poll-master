# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_poll-master_session',
  :secret      => 'd0ed92f27ad1b129f84f70a214a5a50a85767e95d743e4b44bbafb5615ccc0bbd60d5206358d5c973f4ccf176565fab7569256cce098c9bd8d3c0757ddde602d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
