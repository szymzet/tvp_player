require 'json'

class VideoUrlDownloader
  def initialize(object_id, requester)
    @request_url = "http://www.tvp.pl/shared/cdn/tokenizer_v2.php?object_id=#{object_id}"
    @requester = requester
  end

  def video_url
    response = @requester.get(@request_url)
    response_hash = JSON.parse(response)
    strip_slashes(response_hash['url'])
  end

  private

  def strip_slashes(url)
    url.tr('\\', '')
  end
end
