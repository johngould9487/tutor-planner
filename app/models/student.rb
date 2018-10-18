class Student < ApplicationRecord
  has_many :lessons
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_save :geocode, if: :will_save_change_to_address?

  before_save do
    url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD3ij-HtJdr5qgksBH5zRNiS7Rfk0IZe7Q&latlng=#{self.latitude},#{self.longitude}&sensor=true"
    response = RestClient.get(url)
    self.formatted_address = JSON.parse(response)['results'][0]['formatted_address']
  end
end
