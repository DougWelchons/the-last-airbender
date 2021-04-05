require 'rails_helper'

RSpec.describe "Search Index Page" do
  describe "from the welcome page" do
    it "redirects me to the search index page when i click search" do
      visit root_path

      select 'Fire Nation', from: :nation
      click_on 'Search For Members'

      expect(current_path).to eq(search_path)
    end
  end

  describe "when I search for members of a nation" do
    before :each do
      visit root_path

      select 'Fire Nation', from: :nation
      click_on 'Search For Members'
    end

    it "shows the total number of people who live in the fire nation" do
      expect(page).to have_content("97 results found!")
    end
  end
end
