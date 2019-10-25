class SearchController < ApplicationController

  def index
    @stations = stations
  end

private

  def station_response
    Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?") do |f|
      f.params['api_key'] = ENV['NREL_API_KEY']
      f.params['location']= '1331 17th St LL100, Denver, CO 80202'
      f.params['fuel_type'] = 'ELEC'
      f.params['limit'] = '1'
    end
  end

  def station_parsed_data
    JSON.parse(station_response.body, symbolize_names: true)
  end

  def stations
    station_parsed_data[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

end
