class Car
  attr_accessor :id_drivy, :price, :title, :photo, :url

  def initialize(attributes = {})
    @id_drivy = attributes[:id_drivy]
    @price = attributes[:price]
    @title = attributes[:title]
    @photo = attributes[:photo]
    @url = attributes[:url]
  end
end
