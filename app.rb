require_relative 'lib/object_id_parser'
require_relative 'lib/requester'
require_relative 'lib/video_url_downloader'
require 'sinatra'

def show_video_page(object_id)
  downloader = VideoUrlDownloader.new(object_id, Requester)
  erb :show, locals: { video_url: downloader.video_url }
end

get '/' do
  erb :index
end

get '/find-video' do
  parser = ObjectIdParser.new(params[:vod_url])
  begin
    id = parser.parse_id
    show_video_page(id)
  rescue ObjectIdParsingError
    redirect '/'
  end
end
