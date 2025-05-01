class InstagramController < ApplicationController
  require "net/http"
  require "json"

  def fetch_posts
    access_token = "" # Inserir o token depois que criar a organização na Meta (falta licenciar o MEI).
    url = URI("https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,thumbnail_url,permalink&access_token=#{access_token}")
    response = Net::HTTP.get(url)
    @posts = JSON.parse(response)["data"]
  end
end
