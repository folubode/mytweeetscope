class Keyword < ApplicationRecord

def grab_twitts
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "56fr5L6D92AxgtItBMtobalrK"
	  config.consumer_secret     = "rgnTSiI2JWAp65dXSFrSEFQdA8G3UNMp1SXkLKICMHTrPWDlYd"
	  config.access_token        = "3271997323-M9HQq3roa2Byu2tg6bidew83SnFQZy7GJDs53d3"
	  config.access_token_secret = "2RcBkCdZe98xg8L69BGZNO99AtfL2CbkWr4ig4maUejyh"
	end
end

 	client.search(self.keyword, :count => 3, result_type: "recent").take(3).collect do |tweet|
 	  "#{tweet.user.screen_name}: #{tweet.text}"
 	end


#def self.search_words words 
#	CLIENT.search(words, lang: "en").first.text 
#end


end