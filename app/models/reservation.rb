class Reservation < ApplicationRecord
  has_one :collaborator
  belongs_to :description
  validates :product_id, :description_id,  presence: true

end
