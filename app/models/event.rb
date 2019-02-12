class Event < ApplicationRecord
  has_many :attendances
  has_many :participants, through: :attendances
  belongs_to :organiser, class_name: "User"

  validates :start_date, presence: true
  validate :test_start_date
  # if: Proc.new{|a| a.start_date > Time.now}
validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
validate :modulo_duration
 # if: Proc.new{|a| a.duration%5==0}
validates :title, presence: true, length: { in: 3 ..140 }
validates :description, presence: true, length: { in: 20..1000 }
validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1001 }
validates :location, presence: true, length: { minimum: 5 }
end

def test_start_date
		if start_date.present? && start_date.to_date < Date.today
			errors.add(:start_date, "can't be in the past")
		end
	end

  def modulo_duration
  		if duration.present? && duration % 5 != 0
  			errors.add(:duration, "must be a multiple of 5")
      	end
  	end
