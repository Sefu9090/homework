require 'bundler'
Bundler.require

require './app/models/user'
require './app/models/homework'
require './app/models/classroom'

configure :development do
  set :database, "sqlite3:db/database.db"
end