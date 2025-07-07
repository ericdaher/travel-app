class LocationPresenter
  attr_accessor :location

  def initialize(location:)
    @location = location
  end

  delegate_missing_to :location

  def google_map_image_url
    return if ENV.fetch("GOOGLE_API_KEY").nil? || location.lat.nil? || location.lng.nil?

    Rails.cache.fetch("location_#{@location.id}_map_url") do
      "https://maps.googleapis.com/maps/api/staticmap?center=#{location.lat},#{location.lng}&zoom=13&size=600x300&maptype=roadmap&key=#{ENV.fetch("GOOGLE_API_KEY")}".squish
    end
  end
end
