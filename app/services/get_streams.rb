class GetStreams < ApplicationService
  def initialize
    @streams = []
  end

  def call
    channel_infos = {}
    Stream.destroy_all
	  @streams = GetStreamsJob.perform_now("wakfu")
    @streams.each do |stream|
		  channel_infos = stream["channel"]
		  Stream.create(title: channel_infos["status"], name: channel_infos["name"])
    end
  end
end
