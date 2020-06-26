class Description < ApplicationRecord
  belongs_to :product

  enum situation: {available: 0, unavailable: 10}
  enum memory: {RAM_4GB: 4, RAM_8GB: 8, RAM_12GB: 12, RAM_16GB: 16, NULO: 100}
  enum hard_drive: {HDD_500GB: 0, HDD_1TB: 1, HDD_2TB: 3, SSD_128GB: 20, SSD_256GB: 21, SSD_480GB: 22, SSD_980GB: 23, SSD_32GB: 24, SSD_64GB:25, NULO_: 100}
  enum operational_system: {Windows_10: 10, Windows_8: 8, Ubuntu: 20, OS_Majove: 30, OS_Catalina: 31, Android: 40, IOS: 50, _NULO: 100}

  def set_situation
    self.situation = 'available'
  end  
end

