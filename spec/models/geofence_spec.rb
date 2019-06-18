require 'rails_helper'

RSpec.describe Geofence, :type => :model do
    it "Check if the instance exists" do
      expect(Geofence.new).to be_present
    end

    it "- verifies the validity of all properties " do
      geofence = Geofence.new
      expect(geofence.respond_to?(:latitude)).to be_truthy
      expect(geofence.respond_to?(:longitude)).to be_truthy
      expect(geofence.respond_to?(:radius)).to be_truthy
    end

    it "- verify if presence of the properties has been required" do
      geofence = Geofence.new(latitude: nil, longitude: -49.052, radius: 5000)
      expect(geofence).not_to be_valid

      geofence = Geofence.new(latitude: -21.3194, longitude: nil, radius: 5000)
      expect(geofence).not_to be_valid

      geofence = Geofence.new(latitude: -21.3194, longitude: -49.052, radius: nil)
      expect(geofence).not_to be_valid
    end
end
