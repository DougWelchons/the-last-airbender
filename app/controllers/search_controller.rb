class SearchController < ApplicationController

  def index
    affiliation = params[:nation].gsub(/_/, '+')
    per_page = 200
    info = make_api_call("characters?affiliation=#{affiliation}&perPage=#{per_page}")
    @total_members = info.count
    @members = info.first(25).map do |member|
      OpenStruct.new({name: member[:name], allies: member[:allies], enemies: member[:enemies], affiliation: member[:affiliation], photo: member[:photoUrl]})
  end

  private
  def make_api_call(url)
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/#{url}")
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
