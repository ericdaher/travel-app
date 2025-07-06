class LocationRepository
  class << self
    def with_lat_lng
      Location.where.not(lat: nil, lng: nil)
    end

    def top_3
      Location.order(rating: :desc).limit(3)
    end
  end
end
