require_relative '../views/hotspot_view'

class HotspotController
  include HotspotView

  def initialize(hotspot)
    @hotspot = hotspot
  end

  def run
    input = ""
    until input == 'quit'
      HotspotView.show_menu_options
      input = gets.chomp
      case input
        when "1" then results = get_boro_input
        when "2" then results = get_provider_input
        when "3" then results = find_free
        when "4" then results = find_by_address
        when "5" then results = find_by_free_address
      end
      HotspotView.display_results(results)
    end
  end

  def get_boro_input
    results = []
    boros = ["QU", "QN", "SI", "MN", "BK", "BX"]
    puts "Enter a borough:"
    input = gets.chomp.upcase
    boros.each do |boro|
      if boro.chars.all? {|char| input.include?(char) }
        results = @hotspot.search_boro(boro)
      end
    end
    results
  end

  def get_provider_input
    puts "Enter provider:"
    input = gets.chomp
    @hotspot.search_provider(titlecase(input))
  end

  def find_free
    @hotspot.search_free
  end

  def find_by_address
    puts "Enter address:"
    address = gets.chomp
    puts "Enter radius (miles):"
    radius = gets.chomp.to_f
    @hotspot.search_nearby(address, radius)
  end

  def find_by_free_address
    nearby_hotspots = find_by_address
    free_hotspots = find_free
    nearby_hotspots & free_hotspots
  end

  def titlecase(string)
    string.split.map {|word| word.capitalize }.join(' ')
  end

end
