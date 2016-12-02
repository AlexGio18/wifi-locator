module HotspotView

  def self.show_menu_options
    options = <<-TEXT
      1. Show all wifi hotspots in a borough
      2. Show all wifi hotspot from a provider
      3. Show all free wifi hotspots
    TEXT

    puts options
  end

  def self.display_results(results)
    results.each { |result| self.display_hotspot(result) }
  end

  def self.display_hotspot(hotspot)
    output = <<-TEXT
      SSID: #{hotspot["ssid"]}
      Location: #{hotspot["location"]}
      Borough: #{hotspot["boro"]}
      Provider: #{hotspot["provider"]}
      Type: #{hotspot["type"]}

    TEXT
    puts output
  end
end
