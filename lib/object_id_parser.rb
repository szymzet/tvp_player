ObjectIdParsingError = Class.new(StandardError)

class ObjectIdParser
  OBJECT_ID_REGEX = %r{vod\.tvp\.pl/[\w-]+/[\w-]+/[\w-]+/[\w-]+/[\w-]+/(\d+)}

  def initialize(vod_url)
    @vod_url = vod_url
  end

  def parse_id
    raise ObjectIdParsingError unless valid_url?
    @vod_url.match(OBJECT_ID_REGEX)[1]
  end

  private

  def valid_url?
    @vod_url =~ OBJECT_ID_REGEX
  end
end
