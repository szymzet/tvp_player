require 'open-uri'

class Requester
  def self.get(url)
    open(url).read
  end
end
