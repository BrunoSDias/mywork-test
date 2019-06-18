class Timetracking < ApplicationRecord
  validates :latitude, :longitude, :checkin, presence: true
end
