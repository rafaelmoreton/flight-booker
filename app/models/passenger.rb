class Passenger < ApplicationRecord
  belongs_to :booking
  delegate :flight, to: :booking
  validates :name, :email, presence: true
end
