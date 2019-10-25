require 'rails_helper'
describe Station do
  it 'has attributes' do
    station = Station.new(name: 'Electric Station #1', address: 'this is an address', fuel_type: 'ELEC', distance: 'super close to you', access_times: '24/7')

    expect(station.name).to eq('Electric Station #1')
    expect(station.address).to eq('this is an address')
    expect(station.fuel_type).to eq('ELEC')
    expect(station.distance).to eq('super close to you')
    expect(station.access_times).to eq('24/7')
  end
end
