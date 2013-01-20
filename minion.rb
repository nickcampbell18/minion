require 'sinatra'
require 'omxplayer'
load 'lib/directory.rb'

class Minion < Sinatra::Base

  get '/' do
    @files = if params[:folder]
      Directory.instance.navigate(params[:folder])
    else
      Directory.instance
    end.entries.reject {|x| %w{. ..}.include?(x)}
    erb :index
  end

  post '/player/open' do
    Omxplayer.instance.open params[:filename]
  end

  post '/player/:action' do
    Omxplayer.instance.action params[:action]
  end

end