require "uri"
require "net/http"
require "json"

class GetStreamsJob < ApplicationJob
  queue_as :default

  def perform(query)
    url = URI("https://api.twitch.tv/kraken/search/streams?query=game=#{query}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.twitchtv.v5+json"
    request["client-id"] = "x28bv33t0esx5ti6yyc1afad40vb2u"

    response = https.request(request)
    streams = JSON.parse(response.read_body)["streams"]
    return streams
  end
end
