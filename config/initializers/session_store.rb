# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aspireBugtracker_session',
  :secret      => '6d615920093ea57303fe064cbfbe3c2fcd82933f8b7a1746b0f516672f04c0b7cfa5a18aea7be377aeb4298b904a122581d0f616d5d0b0a30b5c583beb4e5bab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
