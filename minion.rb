require 'sinatra'
require 'omxplayer'
load 'lib/directory.rb'

class Minion < Sinatra::Base

  post '/play-file' do
    Omxplayer.instance.open "/media/zeus#{URI.unescape(params[:file])}"
    return Omxplayer.instance.status
  end

  post '/player/:action' do
    Omxplayer.instance.action params[:action]
  end

  get '/*' do
    loc = params[:splat].first.split('/')
    @folders, @files, @loc = Directory.files_and_folders(loc)
    erb :index
  end

end