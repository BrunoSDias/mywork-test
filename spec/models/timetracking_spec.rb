require 'rails_helper'

RSpec.describe Timetracking, :type => :model do
    it "Check if the instance exists" do
      expect(Timetracking.new).to be_present
    end

    it "- verify the validity of all properties " do
      timetracking = Timetracking.new
      expect(timetracking.respond_to?(:latitude)).to be_truthy
      expect(timetracking.respond_to?(:longitude)).to be_truthy
      expect(timetracking.respond_to?(:checkin)).to be_truthy
      expect(timetracking.respond_to?(:checkout)).to be_truthy
      expect(timetracking.respond_to?(:duration)).to be_truthy
    end

    it "- verify if presence of the properties has been required" do
      timetracking = Timetracking.new(latitude: nil, longitude: -49.052, checkin: 1560874347611)
      expect(timetracking).not_to be_valid

      timetracking = Timetracking.new(latitude: -21.3194, longitude: nil, checkin: 1560874347611)
      expect(timetracking).not_to be_valid

      timetracking = Timetracking.new(latitude: -21.3194, longitude: -49.052, checkin: nil)
      expect(timetracking).not_to be_valid
    end
end
