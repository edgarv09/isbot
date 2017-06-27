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
        assert_not_nil match_bot
      end
    end
  end

  def test_add_ua_field
    user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)'
    IsBot::add_ua_field 'developers\.google\.com/\+/web/snippet/'

    assert_true user_agent.is_bot?
  end
end