class Student < ApplicationRecord
  has_many :lessons
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_save :geocode, if: :will_save_change_to_address?
end
