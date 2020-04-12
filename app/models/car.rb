class Car < ApplicationRecord
  validates :price, presence: true
  validates_inclusion_of :new, in: [true, false]
  validates :year, presence: true
  validates :maker, presence: true
  validates :color, presence: true
  validates :model, presence: true
  validates :mileage, presence: true

  def self.search_by_params(price, new, year, maker, color, model, mileage)
    if !!price || !!new || !!year || !!maker || !!color || !!model || !!mileage
      result = Car.where(price: price)
        .or(Car.where(new: new))
        .or(Car.where(year: year))
        .or(Car.where(maker: maker))
        .or(Car.where(color: color))
        .or(Car.where(model: model))
        .or(Car.where(mileage: mileage))
    else
      result = Car.all
    end
    result
  end
end
