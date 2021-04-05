class SearchController < ApplicationController

  def index
    affiliation = params[:nation].gsub(/_/, '+')
    per_page = 200
    @info = make_api_call("characters?affiliation=#{affiliation}&perPage=#{per_page}")
  end

  private
  def make_api_call(url)
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/#{url}")
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
