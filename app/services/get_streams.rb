class GetStreams < ApplicationService
  def initialize
    @streams = []
  end

  def call
    channel_infos = {}
    Stream.destroy_all
    puts "coucou"
	  @streams = GetStreamsJob.perform_now("MindCity")
	  # @streams = GetStreamsJob.perform_now("Wakfu")
    ap @streams
    ap "Salut ça fart ?"
    @streams.each do |stream|
		  channel_infos = stream["channel"]
      ap "Et maintenant, les previews"
      ap stream["preview"]
      # Stream.create(title: channel_infos["status"], name: channel_infos["name"], preview_url: stream["preview"]["medium"], viewers: stream["viewers"])
      # ap Stream.all
      if channel_infos["status"].downcase.include?("mindcity")
		    Stream.create(title: channel_infos["status"], name: channel_infos["name"], preview_url: stream["preview"]["medium"], viewers: stream["viewers"])
      end
    end
  end
end
