require "net/http"

module Google
  class Geocoding
    def self.call(address)
      self.geocode(address)
    end

    private

    def self.geocode(address)
      return {} if ENV.fetch("GOOGLE_API_KEY").nil?

      uri = URI("https://maps.googleapis.com/maps/api/geocode/json")
      params = { address: address, key: ENV.fetch("GOOGLE_API_KEY") }
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body) : {}
    end
  end
end
