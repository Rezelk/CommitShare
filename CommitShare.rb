#encoding: utf-8

require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'haml'
require "active_record"

# DB接続設定
ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "db/users.sqlite3"
)

# DBエンティティ
class Users < ActiveRecord::Base
	#self.table_name = 'users'
end

# ルートアクセス
get '/' do
	@users = Users.all
	haml :index
end
