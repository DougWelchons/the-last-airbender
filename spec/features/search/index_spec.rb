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

    it "shows details information for the first 25 results" do
      within(".results") do
        expect(page).to have_css('.result', count: 25)
        within("#5cf5679a915ecad153ab68fd") do
          expect(page).to have_content("Name: Chan (Fire Nation admiral)")
          expect(page).to have_content("Allies: Ozai")
          expect(page).to have_content("Enemies: Earth Kingdom")
          expect(page).to have_content("Affiliation: Fire Nation Navy")
        end
      end
    end
  end
end
