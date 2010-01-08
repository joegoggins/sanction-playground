# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sanction-playground_session',
  :secret      => '6603a6877e6e12f0d0374be1d65e4991c802f91ea01a892d03a74a2cf09b578886b4d76109bb7e07c1831249f673e98460cd5202c9700453d546e9c25e2cdb5a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
