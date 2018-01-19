class Keyword < ApplicationRecord

	has_many :tweets, -> { order("tweet_created_at DESC") }, dependent: :destroy

	def grab_twitts  # grabing tweets for each keyword
		client = Twitter::REST::Client.new do |config|
	  	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
		end

	 	client.search(self.word,  :lang => "en", :count => 100, :result_type => "recent").take(100).collect do |tweet|
 		  new_tweet = Tweet.new

 		  new_tweet.tweet_id 					= tweet.id.to_s
 		  new_tweet.tweet_created_at 	= tweet.created_at
 		  new_tweet.text 							= tweet.text

 		  new_tweet.user_uid 					= tweet.user.id
 		  new_tweet.user_name 				= tweet.user.name
 		  new_tweet.user_screen_name 	= tweet.user.screen_name
 		  new_tweet.user_image_url 		= tweet.user.profile_image_url.to_s 

 		  new_tweet.keyword 					= self

 		  new_tweet.save

 		  # "#{tweet.user.screen_name}: #{tweet.text}"
 	 	end
	end


# client.search("rails", :count => 5, :result_type => "recent")


	# method for all of the object keywords for each keyword
	def self.grab_all_twitts
		Keyword.all.each do |keyword|
			keyword.grab_twitts
		end
	end

end