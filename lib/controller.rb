require 'bundler'
Bundler.require
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals:{ all_gossips: Gossip.all }
  end

  get '/gossips/:id' do
    @gossip = Gossip.find(params[:id])
    erb :show
  end

  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Auteur : #{params["gossip_author"]}"
    puts "Contenu : #{params["gossip_content"]}"

    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
end


#   post '/gossips/new/' do
#   Gossip.new(params["gossip_author"], params["gossip_content"]).save
#   redirect '/'
#   end
# end

# Gossip.new("super_auteur", "super gossip").save
  