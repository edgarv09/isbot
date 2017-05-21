require 'json'
require 'pathname'


module IsBotParser
  $basedir = Pathname.new(__FILE__).dirname.parent
  PATTERN_LIST = Array.new

  def IsBotParser.data_file
    $basedir + 'data' + 'data.json'
  end

  def IsBotParser.parse
    json_str = IO.read(data_file)
    list = JSON.parse(json_str)
    list.each do |item|
      pattern = item['pattern'].to_s
      PATTERN_LIST.push(pattern) unless PATTERN_LIST.include? pattern
    end
    PATTERN_LIST
  end
end