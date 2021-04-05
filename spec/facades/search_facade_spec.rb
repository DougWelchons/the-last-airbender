require 'rails_helper'

RSpec.describe "Search Facade" do
  describe ".members_by_nation" do
    it "returns 25 members of a nation" do
      members = SearchFacade.members_by_nation
      expect(members).to be_an(Array)
      expect(members.count).to eq(25)
      expect(members.first).to be_an(OpenStruct)
    end
  end
end
