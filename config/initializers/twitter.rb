$client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["CONSUMER_KEY"]
	  config.consumer_secret     = ENV["CONSUMER_SECRET"]
	  config.access_token        = ENV["ACCESS_TOKEN"]
	  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end


# $twitter = Twitter::REST::Client.new do |config| 
# 	  config.consumer_key        = "56fr5L6D92AxgtItBMtobalrK"
# 	  config.consumer_secret     = "rgnTSiI2JWAp65dXSFrSEFQdA8G3UNMp1SXkLKICMHTrPWDlYd"
# 	  config.access_token        = "3271997323-M9HQq3roa2Byu2tg6bidew83SnFQZy7GJDs53d3"
# 	  config.access_token_secret = "2RcBkCdZe98xg8L69BGZNO99AtfL2CbkWr4ig4maUejyh"
# end

# # 