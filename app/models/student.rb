class Student < ApplicationRecord
  has_many :lessons, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_save :geocode, if: :will_save_change_to_address?

  before_save do
    url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD3ij-HtJdr5qgksBH5zRNiS7Rfk0IZe7Q&latlng=#{self.latitude},#{self.longitude}&sensor=true"
    response = RestClient.get(url)
    self.formatted_address = JSON.parse(response)['results'][0]['formatted_address']
  end

  def promote_to_most_recent
    self.update(tag: Student.find_most_recent.tag + 1)
  end

  def self.find_most_recent
    tags = Student.all.map { |student| student.tag }.uniq.sort
    tags.length == 1 ? Student.first : Student.find_by(tag: tags.last)
  end
end
