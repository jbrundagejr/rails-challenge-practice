class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def number_of_floors_available
    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def number_of_floors_occupied
    self.number_of_floors - self.number_of_floors_available.count
  end

  def total_rent
    self.rent_per_floor * self.number_of_floors_occupied
  end

end
