require 'rails_helper'

RSpec.describe Timetracking, :type => :model do
    it "Check if the instance exists" do
      expect(Timetracking.new).to be_present
    end

    it "Verifies the validity of all properties " do
      timetracking = Timetracking.new
      expect(timetracking.respond_to?(:latitude)).to be_truthy
      expect(timetracking.respond_to?(:longitude)).to be_truthy
      expect(timetracking.respond_to?(:checkin)).to be_truthy
      expect(timetracking.respond_to?(:checkout)).to be_truthy
      expect(timetracking.respond_to?(:duration)).to be_truthy
    end
end
