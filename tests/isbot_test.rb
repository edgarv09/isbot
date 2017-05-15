require 'test/unit'
require_relative '../lib/isbot'

class IsBotTest < Test::Unit::TestCase
  $list = [
      'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
      'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',
      'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html）'
  ]

  def test_is_bot
    $list.each {|ua| assert_true ua.is_bot?}
  end

  def test_is_bot_with_block
    $list.each do |ua|
      is_bot ua do |match_bot|
        puts match_bot
      end
    end
  end
end