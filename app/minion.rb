require 'sinatra'
require 'omxplayer'

class Minion < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/player/open' do
    Omxplayer.instance.open params[:filename]
  end

  get '/player/:action' do
    Omxplayer.instance.action params[:action]
  end

end