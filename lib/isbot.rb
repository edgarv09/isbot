require_relative 'parser'

module IsBot
  $init = false
  $regex_str = ''
  $regex = nil

  def IsBot.regex
    unless $init
      list = IsBotParser::parse
      list.each_with_index do |item, i|
        $regex_str += "(#{item})"
        $regex_str += '|' if i < (list.length - 1)
      end
      $init = true
      $regex = /#{$regex_str}/i
    end
    $regex
  end

end

def is_bot(user_agent, &block)
  return false if user_agent == nil
  user_agent.to_s.strip!
  match_data = user_agent.match(IsBot::regex)
  if block!=nil && match_data != nil
    block.call match_data
    return
  end
  match_data != nil
end

class String
  def is_bot?
    is_bot(self)
  end
end