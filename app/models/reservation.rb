class Reservation < ApplicationRecord
  has_one :collaborator
  has_many :description
end
