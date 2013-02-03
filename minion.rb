require 'sinatra'
require 'omxplayer'
load 'lib/directory.rb'

class Minion < Sinatra::Base

  post '/play-file' do
    omx.open "/media/zeus#{URI.unescape(params[:file])}"
    omx.status
  end

  post '/player/:action' do
    omx.action params[:action]
  end

  get '/status' do
    omx.status
  end

  get '/*' do
    loc = params[:splat].first.split('/')
    @folders, @files, @loc = Directory.files_and_folders(loc)
    erb :index
  end

  def omx
    Omxplayer.instance
  end

end