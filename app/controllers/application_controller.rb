require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
      erb :index
    end  

    post '/teams' do 
      @team = Team.new(params[:team][:name], params[:team][:motto])
      @heroes = params[:team][:heroes].map do |h|
        Heroe.new(h[:name], h[:power], h[:bio])
      end  
      erb :team
    end  


end
