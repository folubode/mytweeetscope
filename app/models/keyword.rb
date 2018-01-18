class Keyword < ApplicationRecord

	has_many :tweets

	def grab_twitts  # grabing tweets for each keyword
		client = Twitter::REST::Client.new do |config|
	  	config.consumer_key        = "56fr5L6D92AxgtItBMtobalrK"
	  	config.consumer_secret     = "rgnTSiI2JWAp65dXSFrSEFQdA8G3UNMp1SXkLKICMHTrPWDlYd"
	  	config.access_token        = "3271997323-M9HQq3roa2Byu2tg6bidew83SnFQZy7GJDs53d3"
	  	config.access_token_secret = "2RcBkCdZe98xg8L69BGZNO99AtfL2CbkWr4ig4maUejyh"
		end

	 	client.search(self.word -rt,  :lang => "en", :count => 100, :result_type => "recent").take(100).collect do |tweet|
 		  new_tweet = Tweet.new

 		  new_tweet.tweet_id 					= tweet.id.to_s
 		  new_tweet.tweet_created_at 	= tweet.created_at
 		  new_tweet.text 							= tweet.text

 		  new_tweet.user_uid 					=tweet.user.id
 		  new_tweet.user_name 				= tweet.user.name
 		  new_tweet.user_screen_name 	= tweet.user.screen_name
 		  new_tweet.user_image_url 		= tweet.user.profile_image_url.to_s 

 		  new_tweet.keyword 					= self

 		  new_tweet.save

 		  # "#{tweet.user.screen_name}: #{tweet.text}"
 	 	end
	end


	# method for all of the object keywords for each keyword
	def self.grab_all_twitts
		Keyword.all.each do |keyword|
			keyword.grab_twitts
		end
	end

end