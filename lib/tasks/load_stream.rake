namespace :load_stream do
  desc "TODO"
  task search_stream: :environment do
    puts "Searching for live streams on Twitch..."
    GetStreams.call
    puts "Ah shit. Here we go again !"
  end
end 