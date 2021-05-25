class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees

  def building_names_and_floor_number
    self.offices.map do |office_instance|
      building = Building.find(office_instance.building_id)
      "The #{building.name} building " + "on floor number #{office_instance.floor}."
    end
  end

end
