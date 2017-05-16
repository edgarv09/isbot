# isbot

#### Gem

https://rubygems.org/gems/isbot

#### Usage

```` ruby
require 'isbot'

user_agent = 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

# Three forms of use:

# 1. Use the is_bot function
puts is_bot user_agent # true

# 2. Use the monkey patch method of the String object
puts user_agent.is_bot? # true

# 3. Use the is_bot function with code_blocks
is_bot user_agent do |match_bot|
  puts match_bot # Googlebot/
end
````
#### Attached:

The crawler user-agent data from https://github.com/monperrus/crawler-user-agents, thanks! 😀
