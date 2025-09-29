require 'bundler'
Bundler.require
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end
  
  post '/gossips/new/' do
  Gossip.new("super_auteur", "super gossip").save
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
  end
end