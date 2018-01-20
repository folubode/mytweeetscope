desc "This task is called by the Heroku Scheduler add-on"
task grab_twitts: :environment do
	puts "Grabbing tweets for keywords feed ..."
		Keyword.grab_all_twitts
	puts "done."
	
end

desc "Discard old tweet"
task discard_old_tweet: :environment do
	puts "Deleting old tweets..."
		Tweet.all.each do |tweet|
			if tweet.tweet_created_at < 5.hours.ago
				tweet.destroy
			end
		puts "done."
	end
end