require 'sinatra'
require 'omxplayer'
load 'lib/directory.rb'
load 'lib/array.rb'

class Minion < Sinatra::Base

  post '/play-file' do
    audio_out = params[:audio_out] || 'hdmi'
    omx.open "/media/zeus#{URI.unescape(params[:file])}", :audio_output => audio_out
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