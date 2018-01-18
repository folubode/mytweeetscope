desc "This task is called by the Heroku Scheduler add-on"
task :grab_twitts => environment do
	puts "Grabbing tweets for keywords feed ..."
	Keyword.grab_all_twitts
	puts "done."
	
end