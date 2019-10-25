require 'rails_helper'

describe 'As a user' do
  it "when I vist '/' and I select 'Turing' from the start location drop down and I click 'Find Nearest Station' then I should be on the './search' page where I see the closest station including Name, Address, Fuel Type, Distance, Access Times. I also see travel time and html directions to the station." do

    visit '/'
    within('.navbar-search-form') do
      select 'Turing', from: :location
    end

    click_on('Find Nearest Station')
    expect(current_path).to eq('/search')
    expect(page).to have_content('Nearest Station')

    within('.station') do
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.fuel-type')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.access-times')
      expect(page).to have_css('.travel-time')
      expect(page).to have_css('.directions')
    end

    expect(page).to have_content("0.1 miles")
    expect(page).to have_content("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
  end
end
