class Passenger < ApplicationRecord
  belongs_to :booking
  delegate :flight, to: :booking
end
