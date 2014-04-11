require_relative 'lib/object_id_parser'
require_relative 'lib/requester'
require_relative 'lib/video_url_downloader'
require 'sinatra'

get '/' do
  erb :index
end

get '/find-video' do
  parser = ObjecIdParser.new(params[:vod_url])
  begin
    id = parser.parse_id
  rescue ObjectIdParsingError => ex
    p ex
    redirect '/'
    return
  end

  redirect VideoUrlDownloader.new(id, Requester).video_url
end
