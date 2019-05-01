class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    binding.pry
    boat_length = Classification.includes(:boats).maximum("length")
    Boat.where("length == boat_length.to_i")
  end
end
