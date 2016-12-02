require 'json'
require 'open-uri'

$hotspots = JSON.parse(open("https://data.cityofnewyork.us/resource/7agf-bcsq.json").read)

class Hotspot
  attr_reader :ssid, :location, :boro, :provider, :type, :lat, :long

  def initialize(args={})
    @ssid = args.fetch("ssid", "none")
    @location = args.fetch("location", "none")
    @boro = args.fetch("boro", "none")
    @provider = args.fetch("provider", "none")
    @type = args.fetch("type", "none")
    @lat = args.fetch("lat", "none")
    @long = args.fetch("long_", "none")
  end

  $hotspots.map! { |hotspot| Hotspot.new(hotspot) }

  def search_boro(boro)
    $hotspots.select{|hotspot| hotspot.boro == boro}
  end

  def search_free
    $hotspots.select{|hotspot| hotspot.type == "Free"}
  end

  def search_provider(provider)
    $hotspots.select { |hotspot| hotspot.provider == provider}
  end

  def search_nearby(address, radius=1.0)
    coordinates = Geocoder.coordinates(address)
    $hotspots.select do |hotspot|
      Geocoder::Calculations.distance_between(coordinates, [hotspot.lat.to_f, hotspot.long.to_f]) < radius
    end
  end

end
