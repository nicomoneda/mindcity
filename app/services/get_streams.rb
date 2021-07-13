class GetStreams < ApplicationService
  def initialize
    @streams = []
  end

  def call
    channel_infos = {}
    Stream.destroy_all
	  @streams = GetStreamsJob.perform_now()
    @streams.each do |stream|
		  channel_infos = stream["channel"]
		  Stream.create(title: channel["status"], name: channel["name"])
    end
  end
end
