# isbot

#### Gem

https://rubygems.org/gems/isbot

#### Usage

```` ruby
require 'isbot'

user_agent = 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

# Three forms of use:

# 1. Use the is_bot function
is_bot user_agent # true

# 2. Use the monkey patch method of the String object
user_agent.is_bot? # true

# 3. Use the is_bot function with code_blocks
is_bot user_agent do |match_bot|
  puts match_bot # Googlebot/
end
````

Add a spider User-Agent field:

```` ruby

user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)'

# Add Goole Keep User-Agent match field:
IsBot::add_ua_field 'developers\.google\.com/\+/web/snippet/'

assert_true user_agent.is_bot? # pass
````
#### Attached:

The crawler user-agent data from https://github.com/monperrus/crawler-user-agents, thanks! 😀
