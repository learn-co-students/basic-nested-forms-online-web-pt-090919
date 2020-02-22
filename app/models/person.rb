class Person < ActiveRecord::Base
  has_many :addresses
  # the user may create duplicate enteries
  # accepts_nested_attributes_for :addresses

  # use this code will avoid dublicates
  def artist_attributes=(artist)
    self.artist = Artist.find_or_create_by(name: artist[:name])
    self.artist.update(artist)
  end
end

