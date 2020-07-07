class Product < ApplicationRecord
  belongs_to :manufacturer
  validates :name, presence:true
  validates :name, uniqueness:true
end
