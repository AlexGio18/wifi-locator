require 'json'
require 'open-uri'

HOTSPOTS = JSON.parse(open("https://data.cityofnewyork.us/resource/7agf-bcsq.json").read)

class Hotspot

  def search_boro(boro)
    HOTSPOTS.select{|hotspot| hotspot["boro"] == boro}
  end

  def search_free
    HOTSPOTS.select{|hotspot| hotspot["type"] == "Free"}
  end

  def search_provider(provider)
    HOTSPOTS.select { |hotspot| hotspot["provider"] == provider}
  end

end
