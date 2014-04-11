require_relative '../lib/object_id_parser'
require 'minitest/autorun'
require 'minitest/pride'

describe ObjecIdParser do

  def parse(url)
    ObjecIdParser.new(url).parse_id
  end

  it 'throws when no valid object id found' do
    parser = ObjecIdParser.new('http://vod.tvp.pl/34234239849/jdkfj30/XD')
    assert_raises(ObjectIdParsingError) { parser.parse_id }
  end

  it 'parses the id of the object' do
    assert_equal '14610209', parse('http://vod.tvp.pl/seriale/obyczajowe/na-dobre-i-na-zle/wideo/odc-554/14610209')
    assert_equal '5682863', parse('http://vod.tvp.pl/audycje/kulinaria/michel-ze-smakiem/wideo/odc10/5682863')
  end
end
