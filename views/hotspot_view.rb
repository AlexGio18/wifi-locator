module HotspotView

  def self.show_menu_options
    options = <<-TEXT
    Please select an option (type 'quit' to quit):
      1. Show all wifi hotspots in a borough
      2. Show all wifi hotspot from a provider
      3. Show all free wifi hotspots
      4. Find wifi hotspots near an address or landmark
      5. Find free wifi at an address
    TEXT

    puts options
  end

  def self.display_results(results)
    printf("|%-25s|%-50s|%-5s|%-26s|%-15s\n", "SSID", "LOCATION", "BORO", "PROVIDER", "TYPE")
    puts "=" * 121
    results.each { |result| self.display_hotspot(result) }
    puts ""
  end

  def self.display_hotspot(hotspot)
    printf("|%-25s|%-50s|%-5s|%-26s|%-15s\n", hotspot.ssid, "#{hotspot.location[0..46]}", hotspot.boro, hotspot.provider, hotspot.type)
  end

  def self.display_columns

  end
end
