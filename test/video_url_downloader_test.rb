require_relative '../lib/video_url_downloader'
require 'minitest/autorun'
require 'minitest/pride'

describe VideoUrlDownloader do
  FAKE_RESPONSE = <<RESPONSE
{"url":"http:\/\/195.245.213.193\/token\/video\/vod\/14610209\/20140411\/1473228319\/34f717b0-c305-495e-bb67-8afe80c61fd4","status":"OK","videoId":14610209,"platform":"sdt-v2","userIp":"87.207.174.31","adaptive":false,"live":false,"title":"odc. 554","duration":2847,"countryIsDefault":false,"mimeType":"video\/mp4","ads_enabled":true,"formats":[{"mimeType":"video\/mp4","totalBitrate":1500000,"videoBitrate":0,"audioBitrate":0,"adaptive":false,"url":"http:\/\/195.245.213.193\/token\/video\/vod\/14610209\/20140411\/1473228319\/34f717b0-c305-495e-bb67-8afe80c61fd4","downloadable":false}]}
RESPONSE

  it 'parses the url of the video' do
    requester = MiniTest::Mock.new
    requester.expect(:get, FAKE_RESPONSE, ['http://www.tvp.pl/shared/cdn/tokenizer_v2.php?object_id=14610209'])
    object_id = '14610209'

    video_url = VideoUrlDownloader.new(object_id, requester).video_url
    assert_equal 'http://195.245.213.193/token/video/vod/14610209/20140411/1473228319/34f717b0-c305-495e-bb67-8afe80c61fd4', video_url

    requester.verify
  end
end
