require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  context 'validation' do 
    it 'should validate presence' do 
      manufacturer = Manufacturer.new

      manufacturer.valid?

      expect(manufacturer.errors[:name]).to include 'não pode ficar em branco'
    end
    xit 'should manufacurer uniqueness' do
      manufacturer = Manufacturer.create!(name: 'Dell')
      otherManufacturer = Manufacturer.new(name: 'Dell')

      manufacturer.valid?

      expect(manufacturer.errors[:name]).to include 'já está em uso'

    end
  end     
end
