require 'rails_helper'

RSpec.describe Geofence, :type => :model do
    it "Check if the instance exists" do
      expect(Geofence.new).to be_present
    end

    it "Verifies the validity of all properties " do
      geofence = Geofence.new
      expect(geofence.respond_to?(:latitude)).to be_truthy
      expect(geofence.respond_to?(:longitude)).to be_truthy
      expect(geofence.respond_to?(:radius)).to be_truthy
    end
end
